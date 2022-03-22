locals {
  repos = {
    dpd-test = {
      description = "test of DPD api"
    }
    toulky = {
      description = "App for our trips"
    }
    bara = {
      description = "Bara na Zelandu"
    }
    wsl-setup = {
      description = "Used for setup of wsl and ubuntu"
    }
    vaclav-dvorak = {
      description = "Vaclav Dvorak profile page"
      visibility  = "public"
    }
    apprepo-dash = {
      description = "Dashboard for app repositories"
    }
    game-of-life = {
      description = "Simple implementation of game of life in node.js"
      visibility  = "public"
    }
    go-api-hello-world = {
      description = "Simple hello world api written in golang"
      visibility  = "public"
    }
    go101 = {
      description = "Golang playground"
      visibility  = "public"
    }
    frajer = {
      description = "Frajer v červenci"
    }
    fiddo = {
      description = "Fiddo technical assesment"
    }
    vccsturm = {
      description = "Veteran Car Club Sturm"
    }
    summit-formule = {
      description = "Summit workshop - formule"
      visibility  = "public"
    }
    devops-workshop = {
      description = "Rebood devops workshop"
      visibility  = "public"
    }
    maze = {
      description = "Find way in maze (Computerphile)"
    }
    summit-pokemon = {
      description = "Summit workshop - pokemon"
      visibility  = "public"
    }
    mefbox = {
      description = "Mefovo hřiště"
    }
    anna-helmova = {
      description = "Web Aničky"
    }
    roguna = {
      description = "Playground for roguelike game"
    }
    go-cci-trigger = {
      description        = "Trigger Circle CI job with golang"
      gitignore_template = "Go"
    }
    go-telegram-test = {
      description        = "Attempt on telegram bot with golang"
      gitignore_template = "Go"
    }
    go-game-of-life = {
      description        = "Simple implementation of game of life in golang"
      visibility         = "public"
      gitignore_template = "Go"
    }
    go-names = {
      description        = "Name search exercise with BoubleTee TUI"
      visibility         = "public"
      gitignore_template = "Go"
    }
    go-mandel = {
      description        = "Simple implementation of z^2 mandelbrot set"
      visibility         = "public"
      gitignore_template = "Go"
    }
  }
}
