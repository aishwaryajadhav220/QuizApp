import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State createState()=>_QuizApp();
}
class _QuizApp extends State{
  List<Map> allQuestions=[
    {
      "question":"Who is the founder of Microsoft?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":1
    },
    {
      "question":"Who is the founder of Apple?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":0
    },
    {
      "question":"Who is the founder of Google?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":3
    },
    {
      "question":"Who is the founder of SpaceX?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":2
    },
    {
      "question":"Who is the founder of Meta?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Mark Zuckerburg"],
      "correctAnswer":3
    },
    ];
    int currentQuestionIndex=0;
    int selectionAnswerIndex=-1;
    int count=0;
    int answer=0;
    WidgetStateProperty<Color?> checkAnswer(int answerIndex){
      if(selectionAnswerIndex !=-1){
        if(answerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
            return const WidgetStatePropertyAll(Colors.green);
        }else if(selectionAnswerIndex==answerIndex){
            return const WidgetStatePropertyAll(Colors.red);
        }else{
          return const WidgetStatePropertyAll(null);
        }
      }else{
      return const WidgetStatePropertyAll(null);
      }
    }
    bool questionPage=true;
      
  @override
  Widget build(BuildContext context){
    return isQuestionScreen();
  }
  Scaffold isQuestionScreen(){
    if(questionPage==true){
      return Scaffold(
         appBar: AppBar(
        title: const Text("Quiz App",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Colors.orange,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          Row(
            children: [
              const SizedBox(
                width: 120,
              ),
              Text("Questions:${currentQuestionIndex+1}/${allQuestions.length}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 380,
            height: 50,
            child: Text(allQuestions[currentQuestionIndex]["question"],
            style:const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.purple
            ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: (){
                if(selectionAnswerIndex ==-1){
                  selectionAnswerIndex=0;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][0],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: (){
                if(selectionAnswerIndex==-1){
                  selectionAnswerIndex=1;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][1],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: (){
                if(selectionAnswerIndex==-1){
                  selectionAnswerIndex=2;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][2],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: (){
                if(selectionAnswerIndex==-1){
                  selectionAnswerIndex=3;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][3],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(selectionAnswerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
              count++;
            }
          if(selectionAnswerIndex !=-1){
            if(currentQuestionIndex<allQuestions.length-1){
              currentQuestionIndex++;
            }else{
              questionPage=false;
            }
            selectionAnswerIndex=-1;
            setState(() {});
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.forward,color: Colors.orange,),
      ),
    );
    }else {

    return Scaffold(
       appBar: AppBar(
        title: const Text("Result",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Colors.orange,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAAzFBMVEX/////7SnyyEnxxkrmnRW3Gxz96iz10kHyx0P557n9+e30zl3/8Cbxwy/zzEb64jT/7AD43TetABr//SvklxPBQR///vrxxTi9Lx7+9qf/9Crwvx/0z0P99ua1DxzrsRv336D/+tb/8mnyxiD/+cz22pD84yf889z00nK9Nx3//OP/+MD/8EXppxj/84j55bH77s311X7ntyX/97T/83v/8lz85AP10iH/9Jf00Gj66I/87aX96kv75W342lT21DTETRzVgyLKZR/GWR/TtIzoAAAIHUlEQVR4nO2caXfaOBRAYys1shGL2wluTRYTsEkJJRAIhDYdOu3//08jWytLgpyeY1sc3Q89rI4v70l6kq2enRkMBoPBYDAYDAaDwWAwGAwGg8FgMLyPDqfsM3kPHc8bjUa9Xm8wuL+/n39hzOf46WCA38Bve17V3bxRb4DPfrK4fRoj1H4FhMZPt4vJl/n9oDfyyj7ng3iD+fPk9mWcnu5ymSSr1aqf0pXIXsBvJMlyiT8Wjl9uJ8/zQdWEBs+LlxBbYINu9+bmG+b8/J+DnJ+n797cYLfVCjuFL4vnQdnnL+Etxqid9Ls3QuH8LSStm+4qaaPxojrRmbStfnaObyq84oX/6VvtSdkOnO9tZCX9b0cjcjBE3/qJY7UXZTtw4sC3EApRssKZppBmNM+yHEMYq1oyAFz6iWWhMAyRk6TdQNYL7GuQto+bfuJkH7YIFUqzKLBtAIB9WUuNrPTHDkN6qo7jJBn4gUV08RtZOCQqJpOChfztk1Sl/Vy2A4fJYN4r86VsB85Dg7m8OzLzsh0408ZfR+a+bAfOA08zUFOXSWtO/vhH2Q6EYbwGPDC2ukz7eTS6bdMnqLmOh2WbnLn1AELhYl+qypAmzz6NIIRB3S3TxIuChmyC00xVhg4sPRaa9MuwEURlFZyeCxv2DqCp5oLGPXIQKuPQTG3Y01JmoFezLouKFJ2moxQaxEZ80mpQwg/VnV0VrtKZ1lkXFtizupBpKcmMWVf8TGReZjY/XL3w4LgsHFjF9WaiBFCSQU/sfOeZTHviuVwH2gV3BNM6cYEQq+SvZxCv+AdE5kfaBO8CetD6tEiX4Zr+Wfsh635c0RMoDTSIl2JUJss6L6LhhusCx5wOjQQELkmXoZC5VHCxEF/BuCcypG/ruIDYBFFxzWZIkwyw5PZEpXnpqNiM2KFIm1myHswFNNGKCw3NKhizFzzRO6t1Z3xszHoz1OLPY3KgRmF9gBeTLAP85/PuxFCjJMOz6Db9dPsnlxmSRAviokqBqxkkzZS/0olFd7bJI9MhTea7aCJkyIKFDZ1XJA5wJmREdwZqCi48zXpSZ0aYEZm7wmRoZO7ES9OcPQDrAEiTWfbEke4KjgxrM3Xx0pWY0kCFRoNYKMgzX/RdHZJmxbWZTtTY6QDOvJnoAfzjgWF1Ji1mRPs/m5JfpVHcQOPSM+ddMx9GVRsNqc28cRbE5Q9x5rRrhsUVNLSakYc2N1+jcbLVmEXmgpZiUKHDcaH1DCtnIv7KVJrTqDQaPAfwiAtuMiIMMStninNhRTPk9QzrrrPQKDQaK7tISB//5D0Xrc0KDQwODf0F+V+Vhk3F8oxrJTFrMrwYj4p04YEIZqwjcuU8yyNjtXi5Sud4xY2YlCkr1tmAwKZraWg2uWT+pU2GDV8QFDo3S2GrmMxGmjqDZp48S2hwmYsdPBTtwkdOnGkkKaSpM8iTZ36UfX3IfowCx0vJJmY26ywtXLFEA5SmmwTHzr49XVOXblzKwpkXd6lNPU0MeU4D1FbPrLQvy7LsgS1cNcpxSTON2kCYnlEsyShNajI2UVqGs5lqt4wcozYuW2pO17qk/gyHRtElqU/FGhxsuGXeHiQEGuuhnGeKlzZQ7W64ZmVdkcsYBxEZAgPpMo1qaBJgBzy4Jawy7/KwDux91EKDLtkPAIN18cPLAYYxOKSjUju3mEsAKnDhjODG9p6O0ljTpCp2XOpFs208dwb3dI7PBDZEBcbT6tyhleJNZ8G2DjiWaMjPVIKqqaR4wwhuXeE8Mq9BThPgL0TD6qmkdDrTrZ7t7amAUwO4qqvyDcKduy2bt5rNBgR3FTZJGW41nDdsNni4rEpv/BrSAloq86oNdill4pKPqzo8aoMc7ALr5Vcvx+jIKxupTm1vboOSGh75YakVsiLydXTSQ/sW2gqL3wRFLo3/FWz1S4yeNd9BFCvxazaQV9wqDrtmLOk0a34rSVotv9ZMVeS10KoT7cjYmYDd5I+KXrP8K2aH5gQSwez4MarDwQmbcFkfP0KVeMsGauaCMw3uNRyqArXKMUK026fRFANR2Wf2DjruoVQL1joM/AcYRvUdFVCPNBkr95GuDdrZtofNz+oXl69BZUCGne6weRod/1ZFoVXapuX7LbJ75qVK+/7yMSVtpiX2/oyrs4EhL3RqI09oqrO1JC/kuqd8E3qFNv3khN4bIG8PaE/0HGXYrU5b1wPaC137ZtKZbe3cQk+949+rJFMyVm4vaOjanZHbtsCWS1X2Y+WFrgc2t2UmWizK7EGKmZ3Njm1NC5ohKcx2rtIgPQuaQ02mUttLc0DuUgLNXRktG80VONBkMI6OjYbchL5/c0Nbw0ZDCrMDF9B1LM86Ns2yfXSRuXIZZMQEG3+PJOIfqnbV6R5ZZN5Zd6r2pYCHvQ3Cb1HcZqx3QWWADbbOevsZf1sHmaYSWsiAmtJ9c04N6CgTUk5BBvUbGY+nIBNefM24dvSXCVcfrzM+6i6Dwk/hr+sPGbrLoOTxv8/URXuZ8ObDR+aiv8wjj8tpyFyfTJo9/rm4uDgRGZT0+/3N59OQSf/Xw/DTqchkuWZkqoCRqSpGpqqctIw8zqD0v2nVWMaRK4AGfpIgbWXQ6reoza7xwz+NUF+ZzYWomj/gh58fNZZZ/RLzmVTnq84yWWQk9I7M768XMr80bjMW+rSDhl2zwrZmpInMpd9SwL/UQYbdLXsMLS5pnNCVsy7MQbfaMi6s56Die7U6Xi50uSPAYDAYDAaDwWAwGAwGg8FgMBgMBkPJ/A/O9uF83QqdLgAAAABJRU5ErkJggg==",
            height: 300,
            ),
            const SizedBox(height: 30,),
            const Text("Congratulations",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.orange,
            ),
            ),
            const SizedBox(height: 30,),
            Text("Score:$count/${allQuestions.length}",
            style: const TextStyle(
              fontSize: 25,
            ),
            ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                //Color:  Colors.yellow,
              ),
              onPressed: (){
                if(questionPage==false){
                  questionPage = true;
          currentQuestionIndex = 0;
          selectionAnswerIndex = -1;
          count = 0;
                 
                  setState(() {});
                }
              },
              child: Text("RESTART",
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              ),
            ),
          ),
          ],
        ),

      ),
    /*  floatingActionButton: FloatingActionButton(
        onPressed: (){
         //if(questionPage==false){
           
          //questionPage=true;
      //   }
       //   if (questionPage == false) {
        setState(() {
          questionPage = true;
          currentQuestionIndex = 0;
          selectionAnswerIndex = -1;
          count = 0;
        });
   //   } else {
    //    Navigator.of(context).pop();
    //  }
        },


      ),

*/
           
      
    );
    }
  }
    }