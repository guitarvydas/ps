;; deprecating this - see script2.game

#|

text version of (some of) diagram:
❲❳ --> name which might contain whitespace

scenario pizzeria {

  def rule ❲give bag of money to player❳ (player) {

    // preconditions
    check rule ❲mob boss❳.location = pizzeria
    check rule player.location = pizzeria
    check rule this scenario.enter player
    send command ❲mob boss❳ ❲give bag of money to player❳ player
  }
}

character ❲mob boss❳ {
  def command ❲give bag of money to player❳ (player) {
    check rule my.inventory contains ❲black bag❳
    synonym ❲black bag❳ remove ❲black bag❳ from my.inventory
    change my.location casino
    change my.state ❲waiting for return of money❳
    send command to player ❲add inventory❳ ❲black bag❳
  }
}

-- automatically refined for machine readability --

scenario pizzeria {

  def rule "give bag of money to player" (player) {

    // preconditions
    check rule ❲mob boss❳.location = pizzeria {
      check rule player.location = pizzeria {
	check rule this scenario.enter player {
	  send command ❲mob boss❳ ❲give bag of money to player❳ player
	}
      }
    }
  }
}

character ❲mob boss❳ {
  def command ❲give bag of money to player❳ (player) {
    check rule my.inventory contains ❲black bag❳ {
      synonym ❲black bag❳ remove ❲black bag❳ from my.inventory {
	change my.location casino {
	  change my.state ❲waiting for return of money❳ {
	    send command to player ❲add inventory❳ ❲black bag❳
	  }
        }
      }
    }
  }
}
|#

