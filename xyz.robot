*** Settings ***
Documentation      | =A= | =B= | = C = | \n | 1 | Hello | world! | \n  | 2 | Hii. | Ashish | \n | 3 | string | doc. |
Library            OperatingSystem
Library            String
Variables          xyz.py
Library            Collections

*** Variables ***
${PATH}  ${CURDIR}/rr.txt
${str}  apple mango apple  1   5  9  s d  f
${str2}


*** Test Cases ***
Test_OperatingSystem_Library
    [documentation]  this test perform basic functionality of Testing OperatingSystem_Library
    [tags]  regression
    Append To File        ${CURDIR}/OS.txt           jfhjgk
    Create File           ${PATH}                    hdgfjhfgukjfdttjffjtsjtu
    Copy File             ${PATH}                    KG.txt
    @{items} =	          List Directory	         ${CURDIR}
    log to console        ${items}
    @{files} =	          List Files In Directory	 venv/Scripts
    log to console        ${files}
    ${count} =	          Count Files In Directory	 ${CURDIR}
    log to console        ${count}
    ${rc} =	              Run and Return RC	         ${CURDIR}${/}script.py dsghjkgshd
    Should Be True	      0 < ${rc} < 255
    ${size}=              get file size              ${CURDIR}/ABC.robot
    log to console        ${size}
    @{directories}        List Directories In Directory  Results
    log to console        ${directories}
    ${textcontent}=       get file                   ${CURDIR}/rr.txt
    log to console        ${textcontent}
    Directory Should Be Empty                        Libraries
    Directory Should Not Be Empty                    ${CURDIR}

Test_String_Library
    [documentation]  this test perform basic functionality of Testing String_Library
    [tags]  functional
    ${filecontent}=       get file                   ${CURDIR}/string.txt   #read file content
    log to console        ${filecontent}                                    #print file content
    @{lines} =	          Split To Lines	         ${filecontent}         #divide content into different lines
    ${count} =	          get length	             ${lines}               #count number of lines
    FOR   ${i}   IN RANGE  ${count}
       ${line} =	      Get Line	                 ${filecontent}	             ${i}   #get individual lines
       @{words} =	      Split String	             ${line}                            #divide lines to words
       ${cnt}=            Get length                 ${words}                           #count words
       log to console     ${line}                                                       #print individual lines
       log to console     ${cnt}                                                        #print number of words
       END

Test_String_Library_Advance
    [documentation]  this test perform basic functionality of Testing advance String_Library
    [tags]  smoke
    ${filecontent}=       get file                   ${CURDIR}/string.txt
    log to console        ${filecontent}
    Get Line Count        ${filecontent}
    @{words} =	          Split String	             ${filecontent}
    log to console        ${words}
    @{lines} =	          Split To Lines	         ${filecontent}
    log to console        ${lines}
    ${first} =	          Get Line	                 ${filecontent}	             0
    log to console        ${first}
    ${count} =	          get length	             ${lines}
    log to console        ${count}
    FOR   ${i}   IN RANGE  ${count}
       ${line} =	      Get Line	                 ${filecontent}	             ${i}
       ${line_count} =    get length                 ${line}
       @{words} =	      Split String	             ${line}
       ${cnt}=            Get length                 ${words}
       log to console     ${line}
       log to console     ${line_count}
       log to console     ${words}
       log to console     ${cnt}
       END

Test_String_Library_Advance2
     [documentation]  this test perform basic functionality of Testing advance2 String_Library
     [tags]  functional
     ${ret} =	Generate Random String
     log to console  ${ret}
     ${low} =	Generate Random String	12	[LOWER]
     log to console  ${low}
     ${bin} =	Generate Random String	8	01
     log to console  ${bin}
     ${hex} =	Generate Random String	4	[NUMBERS]abcdef
     log to console  ${hex}
     ${filecontent}=       get file                   ${CURDIR}/string.txt
     ${left} =	  fetch from left  ${filecontent}  ,
     log to console   ${left}
     ${right} =	  fetch from right  ${filecontent}  ,
     log to console   ${right}
     ${first} =	Get Line	${filecontent}	0
     log to console   ${first}
     ${count} =	Get Line Count	${filecontent}
     log to console   ${count}
     ${lines} =	Get Lines Containing String	 ${filecontent}   the
     log to console   ${lines}
     ${ignore_first} =	Get Substring	${filecontent}	1
     log to console   ${ignore_first}
     ${5th_to_10th} =	Get Substring	${filecontent}	4	10
     log to console   ${5th_to_10th}
     @{words} =	Split String	${filecontent}
     log to console   ${words}
     @{all_lines} =	Split To Lines	${filecontent}
     log to console   ${all_lines}
     @{ignore_line_first} =	Split To Lines	${filecontent}	1
     log to console   ${ignore_line_first}
     @{5th_to_7th} =	Split To Lines	${filecontent}	4	7
     log to console   ${5th_to_7th}

Test_String_Word_repetition
     [documentation]  this test perform basic functionality of checking repetitioon of words
     [tags]  sanity
     log to console  ${str}
     log to console  ${str2}
     @{words} =	Split String	 ${str}
     @{words2} =	Split String	 ${str2}
     log to console   ${words}
     log to console   ${words2}
     ${cnt}=            Get length                 ${words}
     log to console   ${cnt}
#     FOR   ${i}    IN   ${words}
#      FOR  ${i}   IN  ${words2}
#          Pass Execution    ${i}   IN  ${words2}
#       ELSE
#         Append To List	${words2}	${i}
#       END
#     END
#     log to console   ${words2}
#     ${cnt2}=            Get length                 ${words}
#     FOR   ${k}    IN   ${cnt2}
#           Log to console ${words}
#           log to console ${cnt2}
#     END

Test_String_Word_repetitions
     [documentation]  this test perform basic functionality of checking repetitioon of words
     [tags]  occurence
     log to console   ${str}
     ${wordcount}=   Call Method   ${call}   word_count   ${str}
     log to console  ${wordcount}

Test_Collection_library
    [documentation]  this test perform basic functionality of checking keywords of collection library
    [tags]  collection
    #Create a list variable
    @{x}=    Create List    b   g   f
    @{animals}=    Create List    dog    cat    bear
    log to console   ${animals}    # ['dog', 'cat', 'bear']
    log to console    ${animals}[0]    # dog
    log to console    ${animals}[-1]    # bear

    #Create a dictionary variable
    &{dictionary}=    Create Dictionary    key1=value1    key2=value2
    log to console    ${dictionary}    # {'key1': 'value1', 'key2': 'value2'}
    log to console    ${dictionary}[key1]    # value1
    log to console    ${dictionary.key2}    # value2

    Append To List	${animals}	x	y	z
    log to console  ${animals}

    log to console  ${x}
    ${y} =	Combine Lists	${animals}	${x}
    log to console  ${y}

    Convert To List	 &{dictionary}=
    log to console  ${dictionary}

    ${xa} =	Count Values In List	${y}	b
    log to console  ${xa}

    ${items} =	Get Dictionary Items	${dictionary}
    log to console  ${dictionary}
    ${keys} =	Get Dictionary Keys	${dictionary}
    log to console  ${keys}
    ${values} =	Get Dictionary Values	${dictionary}
    log to console  ${values}
    ${value} =	Get From Dictionary	${dictionary}	key2
    log to console  ${value}
    ${abc} =  Set To Dictionary	${dictionary}	key	value
    log to console  ${abc}

    @{L} =  Create List    b   g   f  2  1  a  c  b
    log to console  ${L}
    Sort List	   ${L}
    log to console   ${L}
    Insert Into List	${L}	0	xxx
    log to console   ${L}
    ${xrt} =	Get Slice From List	${L}	2	4



#  log to console   ${str}
#  @{words} =	Split String	${str}
#  log to console  ${words}
#    FOR   ${i}   IN   @{words}
#    FOR    ${i}    IN    @{words}
#        Continue For Loop If    $i == 'mango'
#        Log    ${i}
#    END
#
#    log to console   ${str}
#     ${wordcount}=   Call Method   ${call}   word_count   ${str}
#     log to console  ${wordcount}







