# MoccaCanvas for iOS  
Quartz 2D를 활용한 iOS 용 캔버스 앱.  
  
## Version  
__0.2.0__
  * 레코딩 기능추가 (화면에 그린것을 다시 재생)
  * View와 Model의 분리
    * View에서 터치이벤트를 통해 생성된 MCPoint를 ViewController를 통해 Model인 MCCanvas로 전달하고 MCCanvas는 RecordMode 여부에따라 MCPoint를 저장할지 말지 결정하고 받은 MCPoint를 다시 ViewController를 통해 View인 CanvasView로 전달한다.
    * CanvasView는 MCPoint를 받을 경우 해당 MCPoint를 내부변수에 저장하고 화면에 렌더링한다.  
__0.1.0__
  * 터치 이벤트에 따라 화면에 그리기 기능 추가  
