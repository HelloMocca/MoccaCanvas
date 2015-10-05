# MoccaCanvas for iOS  
Quartz 2D를 활용한 iOS 용 캔버스 앱.  
  
## Version  
__0.2.2__  
  * Play중에는 Play버튼이 재동작하지 않는다.  
  * MCShape 객체는 enumerateIndex를 가지고 next메서드를 통해 MCPoint의 배열인 mcPoints를 나열할 수 있다. 
  * 마지막 MCPoint가 반환되면 nil을 반환하고 enumerateIndex는 0으로 초기화되며 다음 호출시 처음부터 다시 나열한다.  

__0.2.1__
  * Play중에 그릴수 없도록 MCCanvas에서 isPlayMode로 확인

__0.2.0__
  * 레코딩 기능추가 (화면에 그린것을 다시 재생)
  * View와 Model의 분리
    * View에서 터치이벤트를 통해 생성된 MCPoint를 ViewController를 통해 Model인 MCCanvas로 전달하고 MCCanvas는 RecordMode 여부에따라 MCPoint를 저장할지 말지 결정하고 받은 MCPoint를 다시 ViewController를 통해 View인 CanvasView로 전달한다.
    * CanvasView는 MCPoint를 받을 경우 해당 MCPoint를 내부변수에 저장하고 화면에 렌더링한다.  
  
__0.1.0__
  * 터치 이벤트에 따라 화면에 그리기 기능 추가  
