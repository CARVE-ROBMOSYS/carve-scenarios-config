#!/usr/bin/lua

-- Copyright: (C) 2019 iCub Facility - Istituto Italiano di Tecnologia (IIT)

-- Authors: Vadim Tikhanoff <vadim.tikhanoff@iit.it>

-- Copy Policy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

-- Dependencies

-- To install posix.signal do:
-- sudo apt-get install luarocks
-- sudo luarocks install luaposix

local signal = require("posix.signal")
require("yarp")

rf = yarp.ResourceFinder()
rf:setVerbose(false)
rf:configure(arg)

---------------------------------------
-- setting up ctrl-c signal handling --
---------------------------------------

interrupting = false
signal.signal(signal.SIGINT, function(signum)
    interrupting = true
end)

signal.signal(signal.SIGTERM, function(signum)
    interrupting = true
end)

---------------------------------------
-- yarp port initializations         --
---------------------------------------
yarp.Network()

port_speech_recog = yarp.Port()
port_speech_output = yarp.Port()
port_ispeak = yarp.BufferedPortBottle()

port_speech_recog:open("/carveSpeech/recognition:o")
port_speech_output:open("/carveSpeech/speech:o")
port_ispeak:open("/carveSpeech/ispeak:o")



ret  = yarp.NetworkBase_connect(port_speech_recog:getName(), "/speechRecognizer/rpc")
ret2 = yarp.NetworkBase_connect(port_ispeak:getName(), "/iSpeak")

if ret == false then
    print("\n\nERROR WITH CONNECTIONS, PLEASE CHECK\n\n")
    os.exit()
end

if ret2 == false then
    print("\n\ncannot connect to iSpeak, you will not hear replies from the robot\n\n")
end

---------------------------------------
-- functions Speech Recognition      --
---------------------------------------

objects = {"Kitchen", "Room", "Corridor", "Bottle", "Pour"}

-- defining speech grammar in order to expand the speech recognition
grammar="See you soon | This is the #Object | Take the #Object | Pour the #Object"

function SM_RGM_Expand(port, vocab, word)
    local wb = yarp.Bottle()
    local reply = yarp.Bottle()
    wb:clear()
    wb:addString("RGM")
    wb:addString("vocabulory")
    wb:addString("add")
    wb:addString(vocab)
    wb:addString(word)
    port:write(wb)
    return "OK" --reply:get(1):asString()
end

function SM_Reco_Grammar(port, gram)
    local wb = yarp.Bottle()
    local reply = yarp.Bottle()
    wb:clear()
    wb:addString("recog")
    wb:addString("grammarSimple")
    wb:addString(gram)
    port:write(wb,reply)
    return reply
end

function sendSpeech(port, cmd)
   --local wb = port:prepare()
   local wb = yarp.Bottle()
   wb:clear()
   wb=cmd
   port:write(wb)
end

function speak(port, str)
   local wb = port:prepare()
    wb:clear()
    wb:addString(str)
    port:write()
   yarp.delay(1.0)
end

print ("expanding speech recognizer grammar")
ret = true
for key, word in pairs(objects) do
    ret = ret and (SM_RGM_Expand(port_speech_recog, "#Object", word) == "OK")
end
if ret == false then
    print("errors expanding the vocabulary")
end

print ("ready to receive command ")
speak(port_ispeak, "Ready")

---------------------------------------
-- While loop for various modalities --
---------------------------------------

while state ~= "quit" and not interrupting do

    local result = SM_Reco_Grammar(port_speech_recog, grammar)
    print("received REPLY: ", result:toString() )
    local speechcmd =  result:get(1):asString()

    local instruction = yarp.Bottle()

    if speechcmd == "This" then
        instruction:addString("this")
        instruction:addString("is")
        instruction:addString("the")
        local object = result:get(7):asString()
        instruction:addString(object) 
        speak(port_ispeak, "Now I know the " ..  object )
    elseif speechcmd == "See" then
        instruction:addString("quit")
        speak(port_ispeak, "bye bye ")
        state = "quit"
    elseif speechcmd == "Take" then
        instruction:addString("take")
        instruction:addString("the")
        local object = result:get(5):asString()
        instruction:addString(object) 
        speak(port_ispeak, "I will now take the " ..  object )
    else
        print ("cannot recognize the command")
    end

    if instruction:size() ~= 0 then
        sendSpeech(port_speech_output, instruction)
    end
end

port_speech_recog:close()
port_speech_output:close()
yarp.Network_fini()
