//
//  SpellingLevel2Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class SpellingLevel2Quiz: SpellingQuiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = super.create(index: index)
        quiz.type = QuizTypes.spellingLevel2
        return quiz
    }

    
    override func wordsString() -> String {
        return """
        about add afraid after again
        ago airplane also always animal
        ant apple ask baby bad
        bag balloon bark barn be
        bean bear because bed bee
        before begin behind best better
        bike black boat both bowl
        bread breakfast bring bunny bus
        bush butterfly button cage cake
        calf call camp cap card
        care cart catch cave chain
        chicken child city class clock
        close cloth cloud clown coat
        cold color cook cookie corner
        could crayon cry cup cut
        dad dark dish doll dot
        draw dream dress drink dry
        duck early eat edge egg
        eight elephant else even eye
        fair far farm fast fat
        father feed feet find fire
        firefighter first fit five follow
        forget four fresh Friday friend
        frog front fur game gate
        gentle girl give glad glass
        goat god gold grass guess
        gun ham hand hang happen
        happy hard have head hear
        hello help hen her high
        him home honey hop horn
        horse hot hot dog hour house
        how huge hurry ice if
        inside jam jet job joy
        jump just kind king kite
        know lady lake lamb land
        last late laugh lay learn
        leave left leg let letter
        light like lion live long
        love lunch mail make mama
        man many map may maybe
        mean meet might milk miss
        mom Monday money monkey moon
        more morning mother mouse much
        must nap near need nest
        new next nice night nine
        none nothing now off old
        once one only onto open
        other our over page pan
        papa paper part party pass
        pay peanut pen pencil penny
        people person pick picture pig
        place plane plate pocket pony
        pool pop print promise proud
        pull push rabbit race read
        ready ribbon ride right ring
        road rocket room rope row
        Saturday saw school sea seal
        second seed send seven sheep
        ship shoe shop should shout
        show side sign silly six
        sky sled sleep small snake
        snow sock some song soon
        sorry spell spin spot spring
        squirrel star start step still
        store street string summer Sunday
        sure surprise swim table tail
        talk tell ten than thank
        their these thing think those
        three Thursday tie tiger time
        tiny today tomorrow toss town
        toy train trap tree trick
        trip truck Tuesday turn turtle
        two under until use very
        wagon wait walk want was
        watch water way Wednesday week
        well were whale when which
        white why wild window wing
        winter wish wolf woman word
        would write year yell
        able above across act address
        age ahead air alarm alligator
        almost along angel another answer
        any April August aunt autumn
        bake ballet banana band bandit
        bank bar basement basket beach
        beef beehive beep behave believe
        belong below belt beside between
        bicycle bit bite blame blanket
        bless block blossom blow body
        boil bottle bottom branch brave
        break bridge bright brook brother
        brush bucket bug bump bun
        burn butcher butter buy candle
        candy canoe carrot carry caterpillar
        cellar cent center cereal chair
        chance chase cheek cheer cheese
        cherry chin chips choice choose
        chop chuckle circle circus climb
        coach copy corn correct count
        country cover cowboy cracker crazy
        cross crow crust cub cupcake
        cup dance dear December decide
        deep deer deliver design desk
        dig dinner direction dive doctor
        dollar donkey door dough donut
        dragon drain drip drive driveway
        drop dumb during each eagle
        ear east easy eighteen eighty
        eleven empty enjoy enough enter
        evening every face fairy family
        fancy fear feather February feel
        felt fence few field fifteen
        fifty fight fill fine finger
        finish fix flag flake flap
        flat float floor flour flower
        fold foot forest fork forty
        forward found fourteen fowl fox
        free fruit full gallon garden
        gate gather giant glasses glue
        gobble good-bye goose granny gravy
        great greet grin grocery ground
        group grow grumpy gum hair
        half hall hamburger hammer handle
        hardly hate heat heavy helicopter
        helium hide hit hold hole
        hood hope hug humor hundred
        hunt hurt hut idea important
        ink island jacket January jar
        jay jeans jelly join joke
        jolly judge juice July June
        keep key kill kitchen knife
        ladder ladybug lamp large lawyer
        lazy leaf less lesson library
        lid life lift likely limit
        line listen lock lot loud
        low luck magic magnet March
        mark mask meal measure meat
        medicine melt merry middle mile
        mine minus minute mirror mix
        month most mountain mouth move
        music nail needle neighbor net
        never nineteen ninety noise noon
        north nose note November number
        nut ocean October odd often
        oil orange outside oven owl
        own oxygen pair pancake pants
        parade parent park parrot past
        paste pat path paw peach
        pear peel peep pepper perfect
        phone picnic pie piece pile
        pink pipe pizza plain plan
        plant please plus point police
        poor popcorn possible postcard pot
        pour power practice present press
        pretty prize pudding puddle pup
        purple quack quart question quick
        quiet quit radio rag rainbow
        raise ranch rare real record
        reindeer rest return rich river
        roar robin rock roll roof
        rooster rose round rub rug
        rush safe sail salad salt
        same sand sandwich sauce sausage
        save scare science scissors score
        scratch season seat seem self
        selfish sell September set seventeen
        seventy shake shall shape sheet
        shell shirt short shovel shut
        signal since sink sister sixteen
        sixty size skate skirt sleigh
        slide slow smart smell smile
        smoke snack soak soft sound
        soup south speak speed spend
        spider spill splash split spoon
        sprinkle stamp stand stare state
        station stick stir stove strange
        strawberry stream strong stupid subtract
        such sudden sugar supper sweet
        syrup tadpole tall tape taste
        tattle teach tear television test
        thin thirteen thirty thought throat
        through throw thumb tick tip
        tire title toad toast toe
        together tonight tool tooth top
        toward tower track tractor travel
        treat trot trouble true trunk
        try turkey turn twelve twenty
        twig ugly uncle understand upon
        upset valid van vegetables visit
        voice wake wall wander warm
        wash wave wear weed weekend
        welcome west while whisker whisper
        wide wind wise without wonder
        wool world worm worry wrong
        yard yesterday yet yolk young
        """
    }
}
