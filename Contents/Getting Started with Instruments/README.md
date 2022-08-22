# Getting Started with Instruments

<img src="./imageFiles/411_hd_getting_started_with_instruments-0001.png">

<br>

## Table of Contents

- [Orientation](#Orientation)
- [Profiling your app](#Profiling-your-app)
- [Using Signposts](#Using-Signposts)

<br>

## Orientation

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0002.png">

- Instrument는 성능을 측정하고 error를 조사할 수 있는 application입니다.
- iOS, macOS, watchOS, tvOS에서 동작을 이해하고, 성능을 최적화하는 것에 사용할 수 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0003.png">

- Time profiler는 OS에서 제공하는 infrastructure를 사용해서 관련 threads의 call stacks를 수집합니다.
- Point of Interest는 Signpost API 등을 사용하여 사용자가 지정한 부분의 data를 수집합니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0004.png">

- Instrument를 켜면 다양한 template가 나오는데 오늘은 Time Profiler에 대해서만 합니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0005.png">

- Time Profiler를 켜면 이렇게 생겼습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0006.png">

- 오른쪽 상단의 버튼을 누르면 Instrument를 추가할 수 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0007.png">

- 왼쪽 상단에서는 기록, 대기, 정지 기능을 사용할 수 있고 Target Area가 있습니다.
- 여기서 조사하기를 원하는 device를 선택할 수 있습니다.
- Instrument를 실행하면 data를 추적하기 시작하는데, Instrument도 일반적인 app처럼 System Resources를 사용합니다.
- 이 때 app에 주는 영향을 최소화하기 위해 Windowed Mode를 사용할 수 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0008.png">

- Windowed Mode는 기록이 끝날 때까지 결과를 분석하거나 표시하지 않고 기록 마지막 몇 초 전에는 events를 무시합니다. 

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0009.png">

- 측정을 완료하면 위와 같게 기록됩니다.
- 상단에는 process, thread 또는 CPU core와 같은 하나의 event source에 대해 시간별 data를 보여줍니다.
- 상단의 Track Filter를 사용해 thread, CPU core 단위로 나누어 조사할 수도 있습니다.
- 아랫쪽에는 선택된 Track에 대해 자세하게 기록된 data를 확인할 수 있습니다.
- 하단 오른쪽의 Inspector에는 확장된 자세한 내용들을 확인할 수 있습니다.
- Instrument는 저장하고 재열람할 수 있습니다.

<br>

## Profiling your app

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0010.png">

- 먼저 조사하고자 하는 app을 선택합니다. 옆의 숫자는 process identifier입니다.
- 그 후 record 하면 기록이 시작됩니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0011.png">

- 기록은 위와 같이 진행됩니다. 예시 app에서 command + R을 누르면 data를 reload하는데, 이 때 interface가 멈춥니다. 이 문제를 자세히 확인해 보겠습니다.
- 상단의 창은 pinch gesture로 확대가 가능하고, cursor를 가져다 대면 CPU 사용량을 확인할 수 있습니다.
- `+` button을 눌러 자세한 내용을 확인할 수 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0012.png">

- 의심스러운 빨간 영역이 있는데, 이 부분이 바로 CPU 사용량 spike가 발생한 부분입니다.
- Spinning이라고 적혀있는데, 이 부분은 main thread가 block된 곳입니다.
- main thread는 user interface의 input과 output을 담당해야하는데 문제가 발생한 것입니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0013.png">

- 좌측의 + button을 눌러 scroll을 내려보면 main thread를 찾을 수 있고, 역시나 spike를 보입니다. click and drag로 특정 부분만 확인할 수 있습니다.
- 아래를 보면 자세한 내용을 확인할 수 있는데, main thread가 96.7%를 표시하고 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0014.png">

- 펼쳐서 보면(option click) 너무 많아서 어디가 문제인지 정확히 인지하기 어렵습니다.
- 그래서 오른쪽 Inspector에서 가장 무거운 stack trace를 확인하면 됩니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0015.png">

- 회색은 System Frameworks와 Libraries 입니다. 하얀색 글자들을 주의깊게 보면 됩니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0016.png"> <img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0017.png">

- thunk는 compiler가 만들어내는 helper code라서 무시하면 됩니다.
- 한 번 click하면 detail view에 표시되고, 두 번 click하면 source code가 나타납니다.
- Xcode 모양을 누르면 Xcode에서 해당 line으로 바로 보여줍니다.
- 수정 내용은 생략합니다. (Global thread에서 해당 구문이 실행되도록 변경하는 내용입니다.)

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0018.png"> <img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0019.png">

- 개선이 잘 되었는지 확인하기 위해 track filter에 main thread를 검색하면 바로 찾을 수 있습니다.
- `+` button을 눌러 main thread를 확인해 보면, 문제가 해결되었음을 확인할 수 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0020.png">

- Time profiler는 responsiveness issue를 확인할 수 있습니다.
- responsiveness issue가 발생하면, main thread를 확인하세요.
- Release Mode를 profile 해야합니다. compiler는 다양한 최적화를 지원하기 때문에 Release Mode가 아니면 실제 app의 동작과 일치하지 않을 수 있습니다.
- 부하가 많은 작업, 오래된 device를 profile하는 것이 좋습니다. Instrument는 iOS, watchOS, tvOS도 다 지원합니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0021.png">

- 그러나 Simulator를 이해하는 것이 중요한데, Mac에서 실행되는 simulator는 mac의 resource(CPU, memory, file system, disk)를 사용하므로 실 기기와의 차이를 잘 이해해야 합니다.

<br>

## Using Sign Signposts

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0023.png">

- Signpost를 사용하면 더 자세히 확인할 수 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0024.png">

- 여러 excution pattern이 존재할 수 있기 때문에 정확한 측정의 log를 남겨야 합니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0025.png"> <img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0026.png">

- Signpost는 구조화된 성능 data를 logging하는 목적으로 사용합니다. 그래서 일반적인 print문보다 더 효과적입니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0027.png"> <img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0028.png">

- 특정 구문이 실제로 얼마나 시간이 걸리는지 확인하려고 합니다.
- Instrument는 print문을 해석하지 못하기 때문에 OSLog의 category를 pointOfInterest로 두고 log를 남깁니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0030.png">

- 이제 Point of Interest가 기록이 되는데, 여러번 불립니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0031.png"> <img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0032.png">

- 200ms씩 8번 불리는데, jumb bar로 자세히 볼 수 있습니다.
- 수정 내용은 생략합니다. (수금지화목토천해 8번 reload해서 1번으로 변경하는 내용입니다.)

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0033.png"> <img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0034.png">

- XCTest에서도 활용할 수 있는데, 자동으로 여러번 실행하여 줍니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0035.png">

- 세 번 click 하면 정확한 하나의 event 기록 내용을 볼 수 있습니다.

<img width=400 src="./imageFiles/411_hd_getting_started_with_instruments-0036.png">

- XCTest를 실행하여 안정적이고 반복적으로 재현하고 개발 주기의 초기에 자주 프로파일링하는 것이 얼마나 유용한지 살펴보았습니다.

<br>

## Referenceg

- [Getting Started with Instruments](https://developer.apple.com/videos/play/wwdc2019/411/)
