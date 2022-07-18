# Planning Pocker

- 정의
    - Planning pocker(Scrum pocker)는 추정을 위한 합의 기반 기술입니다. Software developement에서 개발 목표를 위한 공수 산정이나 상대적 규모 산정에 사용됩니다.
- 목적
    - Project 일정 관리 및 일정 산정
- 이유
    - Sprint에 참석하는 인원들만 참석하기 때문에 외부의 영향을 최소할 수 있습니다.
    - 모든 사람들이 동시에 card를 보여주어야 하기 때문에, card를 공개하기 전까지 일정 산정을 독립적으로 계산할 수 있습니다.
- 장점
    - 무엇을 해야 하는지 모두가 이해할 수 있습니다.
        - 같은 story 혹은 task에 대해 팀원 모두의 생각을 일치시킬 수 있습니다.
    - Backlog(할 일)를 조금 더 명확하게 만들 수 있습니다. 
        - task를 완수하기 위해 필요한 선행 사항이나 비기능 요구사항을 이끌어낼 수 있습니다. 
    - Team members의 일과 삶의 균형을 맞출 수 있으며, 감정을 확인할 수 있습니다.
    - 실제로 높은 정확도로 Spring 이내에 업무를 마무리할 수 있습니다.

<br>

## 진행 전 준비

- Sprint
    - 기간을 선정해야 합니다.
- ViewFlow
    - 이번 Sprint에서 구현할 만큼의 Design review가 완료 및 확정되어야 합니다.
- Backlog
    - 개발 task를 만들고 assignee(s)를 선정합니다.
    - 단, Planning pocker를 진행하면서 일부 task에서 assignee(s)를 조정하는 것도 가능합니다.
- Time available for each team member
    - Sprint 기간 동안 각 Team member가 실제로 개발에 참여할 수 있는 시간이 확정되어야 합니다.
- Cards
    - Planning pocker에서 숫자 card는 큰 공수가 필요한 task의 불확실성을 반영하기 위해 주로 fibonacci 숫자를 사용합니다
        - 예) 0, 1/2, 1, 2, 3, 5, 8, 13, 20, 40, 100
    - 진행자(중계자)를 제외한 참여자의 수만큼의 card decks가 필요합니다.
    - 만약, 물리적인 card가 없다면 smart phone의 app을 이용해도 됩니다.
        - [iOS](https://itunes.apple.com/kr/app/scrum-time-planning-poker/id844162336?mt=8#)
        -  [AOS](https://play.google.com/store/apps/details?id=rs.pstech.scrumtimeplanningpoker)

<br>

## 진행

- 실제 Sprint에 참석하는 인원들이 참석합니다.
- Product manager가 이번 sprint에서의 간략한 개요를 설명하고, Team members는 질문이나 토의를 하여 모호한 사항과 위험요소를 이야기합니다.
- Project manager는 해당 내용을 종합 정리합니다.
- 일정을 산정할 Backlog task(+ assignee)를 선정합니다.
- 각자가 생각하는 개발에 소요될 시간만큼의 숫자 card를 table에 뒤집어 둡니다.
- 모두가 card를 table에 뒤집어 두었다면, 모두가 보이게 동시에 확인합니다.
- 이때 서로가 생각한 개발에 소요될 시간의 차이에 대해 토의를 합니다.
- 정해진 예상 시간을 Backlog에 기입합니다.
- 이번 Sprint에 진행할 모든 Backlog task에 대해 위의 과정을 반복합니다. 
