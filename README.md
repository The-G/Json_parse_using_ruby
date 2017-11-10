
## practice use API about lotto

- parse this json url
    - http://m.nlotto.co.kr/common.do?method=getLottoNumber&drwNo779


1. create controller : lotto
2. set root lotto#index 
3. create button(get lotto number)
4. lotto#show : show lotto random number


- rails g controller lotto index show
- index.erb : <form></form>
- lotto_controller.rb : set logic create random lotto number
- show.erb : show lotto number