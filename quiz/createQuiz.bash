cat quiz.txt | awk '
{
 if ( $0 ~/^Title:/ ) {
  sub(/^Title: /,"");
  printf ("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<wpProQuiz><header version=\"0.37\" exportVersion=\"1\"/><data><quiz>\n <title titleHidden=\"false\"><![CDATA[%s]]></title>", $0);
 }

 if ( $0 ~/^Description:/ ) {
  sub(/^Description: /,"");
  printf ("\n <text><![CDATA[%s]]></text>\n <category>quizz</category>\n <resultText gradeEnabled=\"false\"><![CDATA[That is the end]]></resultText>", $0);
  printf "<btnRestartQuizHidden>false</btnRestartQuizHidden>\n <btnViewQuestionHidden>false</btnViewQuestionHidden>\n <questionRandom>false</questionRandom>\n <answerRandom>true</answerRandom>\n <timeLimit>0</timeLimit>\n <showPoints>false</showPoints>\n <statistic activated=\"false\" ipLock=\"1440\"/>\n <quizRunOnce type=\"1\" cookie=\"false\" time=\"0\">false</quizRunOnce>\n <numberedAnswer>false</numberedAnswer>\n <hideAnswerMessageBox>false</hideAnswerMessageBox>\n <disabledAnswerMark>false</disabledAnswerMark>\n <showMaxQuestion showMaxQuestionValue=\"1\" showMaxQuestionPercent=\"false\">false</showMaxQuestion>\n <toplist activated=\"false\">\n  <toplistDataAddPermissions>1</toplistDataAddPermissions>\n  <toplistDataSort>1</toplistDataSort>\n  <toplistDataAddMultiple>false</toplistDataAddMultiple>\n  <toplistDataAddBlock>1</toplistDataAddBlock>\n  <toplistDataShowLimit>1</toplistDataShowLimit>\n  <toplistDataShowIn>0</toplistDataShowIn>\n  <toplistDataCaptcha>false</toplistDataCaptcha>\n  <toplistDataAddAutomatic>false</toplistDataAddAutomatic>\n </toplist>\n <showAverageResult>false</showAverageResult>\n <prerequisite>false</prerequisite>\n <showReviewQuestion>true</showReviewQuestion>\n <quizSummaryHide>false</quizSummaryHide>\n <skipQuestionDisabled>false</skipQuestionDisabled>\n <emailNotification>0</emailNotification>\n <userEmailNotification>false</userEmailNotification>\n <showCategoryScore>false</showCategoryScore>\n <hideResultCorrectQuestion>false</hideResultCorrectQuestion>\n <hideResultQuizTime>false</hideResultQuizTime>\n <hideResultPoints>false</hideResultPoints>\n <autostart>false</autostart>\n <forcingQuestionSolve>false</forcingQuestionSolve>\n <hideQuestionPositionOverview>false</hideQuestionPositionOverview>\n <hideQuestionNumbering>false</hideQuestionNumbering>\n <sortCategories>false</sortCategories>\n <showCategory>false</showCategory>\n <quizModus questionsPerPage=\"0\">2</quizModus>\n <startOnlyRegisteredUser>false</startOnlyRegisteredUser>\n <adminEmail>\n  <to></to>\n  <form></form>\n  <subject>Wp-Pro-Quiz: One user completed a quiz</subject>\n  <html>false</html>\n  <message><![CDATA[Wp-Pro-Quiz: The user \"$username\" has completed \"$quizname\" the quiz. Points: $points. Result: $result]]></message>\n </adminEmail>\n <userEmail>\n  <to>-1</to>\n  <toUser>false</toUser>\n  <toForm>false</toForm>\n  <form></form>\n  <subject>Wp-Pro-Quiz: One user completed a quiz</subject>\n  <html>false</html>\n  <message><![CDATA[Wp-Pro-Quiz: You have completed the quiz \"$quizname\". Points: $points. Result: $result]]></message>\n </userEmail>\n <forms activated=\"false\" position=\"0\"/>\n <questions>"
 }

 if ( $0 ~/^QuestionM:/) {
  sub(/^QuestionM: /,"");
  printf ("\n  <question answerType=\"multiple\">\n   <title><![CDATA[Question]]></title>\n   <points>1</points>\n   <questionText><![CDATA[%s]]></questionText>\n   <correctMsg><![CDATA[Correct]]></correctMsg>\n   <incorrectMsg><![CDATA[Wrong]]></incorrectMsg>\n   <tipMsg enabled=\"false\"><![CDATA[hint]]></tipMsg>\n   <category></category>\n   <correctSameText>false</correctSameText>\n   <showPointsInBox>false</showPointsInBox>\n   <answerPointsActivated>false</answerPointsActivated>\n   <answerPointsDiffModusActivated>false</answerPointsDiffModusActivated>\n   <disableCorrect>false</disableCorrect>\n   <answers>", $0);
 }

 if ( $0 ~/^QuestionS/) {
  sub(/^QuestionS: /,"");
  printf ("\n  <question answerType=\"single\">\n   <title><![CDATA[Question]]></title>\n   <points>1</points>\n   <questionText><![CDATA[%s]]></questionText>\n   <correctMsg><![CDATA[Correct]]></correctMsg>\n   <incorrectMsg><![CDATA[Wrong]]></incorrectMsg>\n   <tipMsg enabled=\"false\"><![CDATA[hint]]></tipMsg>\n   <category></category>\n   <correctSameText>false</correctSameText>\n   <showPointsInBox>false</showPointsInBox>\n   <answerPointsActivated>false</answerPointsActivated>\n   <answerPointsDiffModusActivated>false</answerPointsDiffModusActivated>\n   <disableCorrect>false</disableCorrect>\n   <answers>", $0);

 }

 if ( $0 ~/^ok:/) {
  sub(/^ok: /,"");
  printf ("\n    <answer points=\"1\" correct=\"true\">\n     <answerText html=\"true\"><![CDATA[%s]]></answerText>\n     <stortText html=\"false\"><![CDATA[]]></stortText>\n    </answer>", $0);
 }

 if ( $0 ~/^wr:/) {
  sub(/^wr: /,"");
  printf ("\n    <answer points=\"1\" correct=\"false\">\n     <answerText html=\"true\"><![CDATA[%s]]></answerText>\n     <stortText html=\"false\"><![CDATA[]]></stortText>\n    </answer>", $0);
 }

 if ( $0 ~/^---/) {
  printf "\n    </answers>\n   </question>";
 }
}

END{
 printf "\n </questions>\n</quiz></data></wpProQuiz>\n";
}'
