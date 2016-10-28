class Imes::D238hsController < ApplicationController
  before_action :set_imes_d238h, only: [:show, :edit, :update, :destroy]

  # GET /imes/d238hs
  # GET /imes/d238hs.json
  def index
    @imes_d238hs = Imes::D238h.all
  end

  # GET /imes/d238hs/1
  # GET /imes/d238hs/1.json
  def show
 #   if params[:bdbh] = 'tooling'
 #       redirect_to tooling_imes_d238hs_path, notice: 'SO號碼不存在或者狀態不對, 請重新輸入'
 #   end

 #   if params[:bdbh] = 'print'
 #     redirect_to printend_imes_d238hs_url
 #   end
  end

  # GET /imes/d238hs/new
  def new
    @imes_d238h = Imes::D238h.new
    @imes_d238h.apply_date = Time.now
    @imes_d238h.bdrq = Time.now
    @imes_d238h.bddm = 'D238'
    @imes_d238h.applicant = current_user.email.split('@').first.upcase
  end

  def tooling
    @imes_d238h = Imes::D238h.find(params[:bdbh])
  end

  def startflow
    @imes_d238h = Imes::D238h.find(params[:bdbh])
  end

  def print
#    socket = TCPSocket.new('172.91.39.42','9100')
    socket = TCPSocket.new('172.91.39.38','9100')
#^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR4,4~SD30^JUS^LRN^CI0^XZ
#^XA
#^MMT
#^PW900
#^LL0150
#^LS0
#^FT449,134^A0N,28,50^FH\^FD1609300003^FS
#^FT142,134^A0N,28,50^FH\^FD1609300003^FS
#^FT449,92^A0N,33,31^FH\^FD1637^FS
#^FT142,92^A0N,33,31^FH\^FD1637^FS
#^FT449,49^A0N,37,24^FH\^FD0504000860000^FS
#^FT142,49^A0N,37,24^FH\^FD0504000860000^FS
#^PQ1,0,1,Y^XZ


#^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR4,4~SD20^JUS^LRN^CI0^XZ
#^XA
#^MMT
#^PW945
#^LL0768
#^LS0
#^FO256,640^GFA,01024,01024,00008,:Z64:
#eJzt0jsKwkAQBuCJC0kIMaZMoegRgo2pNDcxRxBsUlgEBAtPkKOIleAFLC0DdlZWImlisvOvsAFBLKyc5tvZF8POEv3Dokjay1K40nKD/J/WY7fsMyOly4Ytxx47gbMNO7iz+VRinE2pyGHAduwO73OX8MJ2j8jXUOjakETJWvOMB06BlRSiMjLVCWw0IClj+iqClhEMPzKDhxgWuoUyUTb/QlCyaLTK637XWFXVo9bbljKvb48C3UDThV7oy44PT77sqHMj7mwKPWhCyuDrXZVqXv2g9/EEjCouMA==:EC1E
#^FO192,640^GFA,01024,01024,00008,:Z64:
#eJzl0jFOwzAUBuBnapoMFmRg8BDRihN47IAgl0BZESfwgsoEPga3IUeAG+QEqEgdGFBC8/4/SMnCxISHfGoTv/892SL/fi1SqWbNJb2a/JaU/1Hy0djBzGziLY10J6d0pX7Kufol6PdOHrgvqmvTUqUNS3Uf3IDpime1ftsj9aOD93WlOsH+JeuJbGhJrT6NoLAkzBWjBprWw6ZUFynj8FmD781uqvD/X1fFfehPjulh8mEVNLDvSDfU872DZxau3i80/3q71frreep4G5yjGF8sj83yGG9qzNG9oK9X00zqjIVDwjAB4zyGSt889X0/2PqA8/YFAnJvmU9P0JFjfj5en59rhQAx80kO6xtoZjZy:ACFF
#^FO128,640^GFA,01024,01024,00008,:Z64:
#eJxjYBjpgPEAH5hmfiAHpeVR+AwOLDS1nweNlsEhjpOGOC+Bh68BRBewyH8A0b/a5H+B6P9tEvUgiUNtEtwPgPSBNglGkAKHNgkGMH2MgwEknnCsgwGkLsEdSju/ANMKTjVg87UeQxxm/xhisZUyF8ReZqg7cNINEJoRF82ASpMKcJpLgGaA0AcgNOP///9/LYDQ/4HhwrxI6ZESA1QFRDmEZu5zgNB8UJoHQjNxJEDNhdBMUJodKs7eoQexvgcacTwSYMqBRQBM/1u3axXIJSD7QTYtYF+kBHYZG9TcRxYQ+hAkHhibIeHPyAwNaGaohxgZHKD+VIDy8QEAc2BGmQ==:1ED6
#^FO352,224^GFA,03584,03584,00008,:Z64:
#eJzd1s9rHGUYB/Bn9l1nh7jszqVlhCUZyU2hjuYyNGF3/Usybe4SD5JSgnk3SnrpwZsXD8GTtNBeSwPNlBy8iTePTtFDQLAWipQ07Djv8/3Oyq5ZjDEg+Bz2w868v3+OyP8krtOdH8qXalmObWX5yZUyryxE3i2gqXXvs0qBDdp0xmK1vPjpC3j0Wk2OvqUGPvOmDG+M1CgbaQHhRDulxLv7aPGP+C8n7EFB7bn7frFI5rhJfwMeNcW0rXxB7cqS2peBda7Jtv4v5JVmz70vNJuV0NkRmFZDhNpCNZNUHcp2gAqutVnhXSWWByz3U/VVVaMrf1y1wMV71OQty4R2qj8pZbGuJRoNamQm7OyDORHSvxtQ6MHYWB3YTTMqnLfNkVrmG1rvLyfLata7qtniZkAjuBdrh8K9rKfuZh2Yt5xLvz7XdV81bpCzg2d1qG789YZWL/0WUg8ewrdeIFcUw0BqEd2tnVI9ODh0b9rcP5cVdWHti9qUK2r3sNx35XXL0g18s2O9otIPqiWqxrpR/eBth7dHf28mTnMCG0tQ3vwZNra2YP9AN7DpyLpq7IJm1NLd6ipUb7IMUoqWetanDT431KuHws4Zon8WFxzQmNsloSmaK9t0TD+iG/TGnZ1Tzf+wLK1z8HI9d+Ws4iQJV3DChMui8xEazEdU6dJHHIDen2pE+rZKT2WuOTsyq53xX8cC7dMubVHD6nUfesd0DE1p4ZcFnttHUIJpP4/gHv5LpUCtZ7gX6AyVz+89UbHc5eufrsWa7ogTWvthc9ohvfkE7vD8v43s7oK8pGCBkxKLOeJ9bOHHOXy/gCunavDBA02/luoykjSVfedmhHM4o0MqUQqDWzSjQzq5MHjgTsSRmQyVYYJunDx+fM9W01KNtzt3vW+i4L77L1Eb8xN0sLHbPuV9E9T3Tn08z12w54zhnOx/kes153ot8AmVF5jw/FmBxxuxmt2kmVpkGK9yi5bHTu/7ZFvHxyZ9jFeyQpNHapjcQn3JGgx7MFqkun4bEmr76s3T4XLpcfiD+v72OX4dc8wEpyhGUE84WWeXHCZ3v03OW1tatQI7tE1xY7Z5ft01++qp0evTG7cO3QNv3X9D29/ZFd2ATYOC/WWcl1V3tWJ/FRX7A5wr/qDQdeV76P47I3wuDUZ3tF2r3q7LLhti9QIyYlPaox34VQN2P4PmKc3txQZqXrC4+qA2Z+rxvWfnmJ+tfIfvbtHtWMXrQ5jJ+Yxnzp85LnLDLXKZrXG+U7Y/aeE8irv8wF/k92uP6zOafCf+F/EHPSAn9Q==:08B0
#^FO352,640^GFA,01024,01024,00008,:Z64:
#eJzl0j1OwzAUAOBnOziWCG5GhiqJOAAgsUSA1BwlR8gRos5IXCFzBmDsBDkAhzDqgpg6VuIn9P0UqRsS6oSHfLKt+P3oAfz3pQZPmpCJ+c4eqmhPkVvGDERteN/EfLzitGCdsK9O0knZGnY97b/oejaO+FC4PDnbqNYpGDx/TEGjcQpUj3nQIPE4rjOBjBRZ67JAQ9pwOo4DNa4iy/6tR4/GcUT9bXuH2gMuR9uOVPaY41ipx1pWGylf+qB/3K4C/rS2D0kckDohfsGvg8k7msCE8s/A36M5JPTDrI3IfGAPgyXdSiy5gJspqZ69VhjsIyb1wsxRmPol6bPlEyYQX198UlaLq47S6aQvg/SlknwLmYfNjRjERjwXpcEgAwIyMPCbuf0GhgA8zQ==:06FC
#^FT71,281^BQN,2,7
#^FDLA,@2202000180000@382A@BV2308-1@0010800@160913@20160908@270@1@20160912134316^FS
#^FT841,768^A0B,38,21^FH\^FD\B5\BD\E6\B6\8F[\00\00\00^FS
#^FT491,674^A0B,42,40^FH\^FDFPF 100UF 450V M 18*35.5^FS
#^FT565,248^A0B,33,64^FH\^FD30/30^FS
#^FT765,319^A0B,33,40^FH\^FD_____^FS
#^FT765,485^A0B,33,40^FH\^FD_____^FS
#^FT706,319^A0B,33,40^FH\^FD_____^FS
#^FT765,650^A0B,33,40^FH\^FD_____^FS
#^FT706,485^A0B,33,40^FH\^FD_____^FS
#^FT706,650^A0B,33,40^FH\^FD_____^FS
#^FT635,685^A0B,33,64^FH\^FD1000^FS
#^FT765,768^A0B,33,31^FH\^FD\E3\85\B5Q\05^FS
#^FT564,674^A0B,33,57^FH\^FDFALA201630^FS
#^FT706,768^A0B,33,28^FH\^FD\FA\BD\B5Q\05^FS
#^FT104,544^A0B,33,33^FH\^FDBV19037^FS
#^FT636,768^A0B,33,31^FH\^FD\D2\EC\B5Q\05^FS
#^FT923,213^A0B,25,24^FH\^FD20160927 160801^FS
#^FT840,650^A0B,37,74^FH\^FD1100087082^FS
#^FT565,331^A0B,33,31^FH\^FD\F1\85\A7Q\05^FS
#^FT314,650^A0B,42,40^FH\^FD20160927^FS
#^FT564,768^A0B,33,33^FH\^FD\AF\E4\E6Q\05^FS
#^FT104,709^A0B,33,33^FH\^FD381A^FS
#^FT243,650^A0B,42,40^FH\^FD16090275^FS
#^FT172,650^A0B,42,40^FH\^FD1914014981009^FS
#^FT491,768^A0B,42,40^FH\^FD1\91,Q\05^FS
#^PQ1,0,1,Y^XZ

    socket.write('
^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR4,4~SD20^JUS^LRN^CI0^XZ
^XA
^MMT
^PW945
^LL0768
^LS0
^FO448,224^GFA,01024,01024,00008,:Z64:
eJxjYBgFpIKEAgj9oAKNhoo7CFDFGiYozYaDZsJOszHzOoBo9mb5ByCa/7P8Hwgt8Q9EswQKhINpQQF2CB0BptkET7CAjRH8AaV3gM1j/jkHQj/sgdCMLRCLGBugFqPTB3CIw2hSQakDhK7/AaX/QOgHcmAqwIUHTP9x4YDQIWD1TGfqP4BodpfyCyCaLUUJLM2WZg6WZ1GyhzjUzAhinP27B2Da/P8HqADEwQasEHUVSmB5lholcDyz8ylJgOnjhuD4Zn/6EaK+pBBC21lA9MlJQGg2aMCwwANoEAAA5Wk26g==:82FF
^FO704,576^GFA,02304,02304,00012,:Z64:
eJzt1LFKw1AUBuCbprQBQxong8Q24KBUaCMuGap18zWqL9COVcTeTm6iPog4OknEwVV3h+vmVOymDo1Tz/8LLVTEQfFMH5f05O8990ap//ozZfdTsplsDf98+eSIHE+0rzq0Cnc/2YgPLXjLhuOiHtOJPVkO/VBcPr0SVx5exLm3dyTb7MFeSXoq20opvyG3RJGOxB2DfTAJGXmU9tBfFck2+auVI9fJC6BvwwE5IYdwzoWLjztwNoLnp4zdpbG7AZynfahdwL0MPjihzNTe19QSLo0GZuxKlsmAF53I4AfxNpzAecqm3Bk8SzlknEkVkWPaoMSBjwKc/3YsBze/tytBC9UWvAZXm8vi3tKK7Fx7WJP+9rAh/e3mpRnbCs9SxD/X4tI9/ZVjWXdc3ItwFfei3MDjc9dVed66w1zU7eBVTCNSUQKraXMpkPnMz1KWnmy+d3QXpjliW/BGn3xDfhIW1vfFXlyX93o+vgNegGwu2QkS5HS65GdySlbpRKtvWatfWh+UT1vU:5BA8
^FO640,640^GFA,01024,01024,00008,:Z64:
eJxjYBgFOEFCAYR+UIFGQ8UdBCgyngUHzQNlIWgeiLwDmGZjSQDT7C4ffEA0/5E/Z8D013tgmudLE5hmVZkElmdV2wSht/0PAdOT/v8BGzcpLARCB6WAxT/Fg2n2R/lpYNqpHkyzMCWoge1ndmCD0AxMOGgIYESjCYIGqHocNDOMnhAAptk3QMKf3QBC8xk8ANMyhgfAtJUhREOxIETfY0g0sR4WADP4mev/gWh5xv//wXTjr34QLXpwBjtY4ccOSLjXQmmZDog57LwQ85l5IPYx8kDTQY8FhIalBwWovwzwe3swAAA0szb5:18B4
^FO576,640^GFA,01536,01536,00012,:Z64:
eJxjYBgFQwIwMzfA2ezMB3CwEWqYGBBsWgAFItgJSDxUdgKcrYRgGygj2FbqTXB2nfozOLt+3Tc4O32JGJytqTIJwTZFsHW3/1oAY+tM//8AxlaZtGkBgj0Z7jb9Sb/hbHvhagO4e4R/w9kKwoxwNoMUA4ItwSBABBsBOHCwKQMKRLATYAyeBoYHMLYMEluiCcEWaGc8ANfZvrgBzj7+HWH4sX0I9iE5ONvKyR7OrncuhrOrfycjzKl1QLD1D8DtYlJ+4ABjsy/4AXc/+wcbuHKmH3xwNoMFO4KtgJQXGFDywgMktgIO9ogBADV8Oek=:3BF9
^FO512,640^GFA,01024,01024,00008,:Z64:
eJxjYBgFuABj4wEwzdz4AI2GiDMyOFBkvgAO2gDKQtAGYFoQQksINoBpWeGDYNpe+DOEvl4Npo0vcYNpkUmeEHrWSTAtdvtvAJj2/v8BRAt5RgZAaM8JIFr8ZC2Ylu/cOwNsPudfMC3A2QCmGXgZJMA0DwMHDhoCWNBoUkNAAOpfGC0BpwvAtBQD2P2s8hcPgGj+/v8NYPpOPFia4488xDQZQbA4A1sChGZ0cABzlRsUQDS7ugDYXOZldmBzBbbEg2n5fcJgc+3/B4JpBbnKB2DtdyDyjNO4wPoYBTkg7pXsgLrbBxI+DDmQ8IAHCAfBgBgwAAB3ejcQ:F89B
^FO448,640^GFA,01024,01024,00008,:Z64:
eJxjYBgFuEBCAYR+UIFGQ8UdBKhjDwd+OgFKF0Dpf1D6P4SWeH8CTMs4Qmg5jx4wze4DoRn+QOn6//+RadaUIy5gdSpgioEfSvMpPQHTLOZHIPrs2KD2Q2kHKM2Ai2ZBo4kEsND8AaWhoc0gAaWh3mbjYGBHptk5//GB/cP5fw6IZux+PwPM/80CNpH/J4MBiOYtFIEYo2jfAGYI2n+A2NvwA0rLQFz9rg9E87n8PwbWX9fcBDb3PgMjWN0BBkawAQlQdymguR8WfUMCAADZjy64:C4C0
^FO352,640^GFA,01536,01536,00012,:Z64:
eJzt0bFKxEAQBuDZ3ZA0wRxYCBa6XKGdWKa4IoUPcoUPYGl38YSrvTc4bIQUeYSwj3KlWByClsGx2v/fRhC0OXGqj2HY+dkR+a+9KOdauHDhC3PGCv1bZb7jZG0Sp3Yvm+iZ09fo09VuG320aprowx09uaUfaLMe6beeHnPOD8muytDu7hF5TGBO2wc4P2jYP/bwcgIaVbyZWrqhw/u2wrxYu6XlJnEtP6gQ4aXCgoUaWLWdR19fCeytYMY7hadP9Lm+C/0MezPScpG4gBd639IBOadnzGzKEnlseeKj83J2iX5Ww8tsjgvoB2Ka5Pul6wfYZkViizwuk4Z9wV7JhBf+4/UJQk9RjA==:EC21
^FO288,640^GFA,01024,01024,00008,:Z64:
eJxjYBgFOICEDIS2kEOjoeICLNS1zwGNTkClE9DoFCitpwCh7Q0g9O4PYIpxYwGYZt4AEWcWhNBMghMg6qRhtACElkCnZaH22z+A0KI1UAFoODCwQ2nGBijjAA6fEAAsaDQPUTQzCw6aDUwzMraBaeZGCM3+//8fZJpVcLIIxLhmFhRaAkrLNrKBaXsozXoAQjN8gNICTBCaA0qzMEPdx0SUrwcHAACCCx0K:BB91
^FO192,640^GFA,01024,01024,00008,:Z64:
eJzt0S2OAkEQBeBqqqERw4AgYcUE5ggcAIEg3IBgERwAiSCT2ZshOABm5WbnBmt2EwRJE+o9xJCgMAjafJn+qX5dI/IeD8dqA6vtnZyf9p68wNM2TWp6yfgFMzqUiTkS5OmUJ+xzxysNr+XV4INNhwPKhb8dqhcFHCz3pn5WptvzXTIGfF97hXxZH3knKRyHmZkr6oireP7m9OHLa+tdnm9CL7BFUxqoQve/gDGW5teiXl3ZXteigdf92n4ZRdQbMn/fYd3nOD5fWz6N0fobfr7PFqvxYf/Ba4L+aNpjfaq3AHe+4LgAJmgszw==:5D04
^FO128,640^GFA,01024,01024,00008,:Z64:
eJxjYBgFuICBBYQusEGjoeIKHFSxhhFKM+OgGbHTzIxtC8D0wf4PIJr9Z/8/CN1TD6KZNDq0G0A0RwczhF4Dppk5njCBjeH4A6XvQIz9cw5CfzgGoRsOQS08AKUd0OgEHOIwmhBQwGEedpoJSrN/LxcA0////28A0vxAGsTngJknCaWtN0BoYwMIrSQAoQWgtKEQlBaD0Jp8YIqZlwdC////C2YP2P6OHVxgCZ45EPUSfVD6ONSdhxug/jkApRVQ6cEIAJQ4MgA=:1F4E
^FT83,352^BQN,2,7
^FDLA,@2202000180000@382A@BV2308-1@0010800@160913@20160908@270@1@20160912134316^FS
^FT408,662^A0B,42,40^FH\^FDFPF 100UF 450V M 18*35.5^FS
^FT494,248^A0B,33,64^FH\^FD30/30^FS
^FT694,319^A0B,33,40^FH\^FD_____^FS
^FT694,485^A0B,33,40^FH\^FD_____^FS
^FT635,319^A0B,33,40^FH\^FD_____^FS
^FT694,650^A0B,33,40^FH\^FD_____^FS
^FT635,485^A0B,33,40^FH\^FD_____^FS
^FT635,650^A0B,33,40^FH\^FD_____^FS
^FT564,662^A0B,33,64^FH\^FD1000^FS
^FT494,662^A0B,33,57^FH\^FDFALA201630^FS
^FT116,544^A0B,33,33^FH\^FDBV19037^FS
^FT840,296^A0B,25,24^FH\^FD20160927 160801^FS
^FT762,591^A0B,42,45^FH\^FD1100087082^FS
^FT325,650^A0B,42,40^FH\^FD20160927^FS
^FT116,709^A0B,33,33^FH\^FD381A^FS
^FT255,650^A0B,42,40^FH\^FD16090275^FS
^FT184,650^A0B,42,40^FH\^FD1914014981009^FS
^PQ1,0,1,Y^XZ
')
    socket.close

    redirect_to printend_imes_d238hs_url
  end

  def printend
  end
  
  # GET /imes/d238hs/1/edit
  def edit
  end

  # POST /imes/d238hs
  # POST /imes/d238hs.json
  def create
    @imes_d238h = Imes::D238h.new(imes_d238h_params)
    respond_to do |format|
      if @imes_d238h.save
        format.html { redirect_to @imes_d238h, notice: 'D238h was successfully created.' }
        format.json { render :show, status: :created, location: @imes_d238h }
      else
        format.html { render :new }
        format.json { render json: @imes_d238h.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imes/d238hs/1
  # PATCH/PUT /imes/d238hs/1.json
  def update
    respond_to do |format|
      if @imes_d238h.update(imes_d238h_params)
        #format.html { redirect_to @imes_d238h, notice: 'D238h was successfully updated.'}
        format.html { redirect_to tooling_imes_d238hs_path(bdbh: @imes_d238h.bdbh) }
        format.json { render :show, status: :ok, location: @imes_d238h }
      else
        format.html { render :edit }
        format.json { render json: @imes_d238h.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imes/d238hs/1
  # DELETE /imes/d238hs/1.json
  def destroy
    @imes_d238h.destroy
    respond_to do |format|
      format.html { redirect_to imes_d238hs_url, notice: 'D238h was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_customer_name
    customer_id = params[:customer_id]
    customer_id = customer_id.upcase if customer_id.present?
    sql = "select kunnr, name1 from sapsr3.kna1 where mandt='168' and kunnr=?"
    rows = Sapdb.find_by_sql([sql, customer_id])
    if rows.present?
      render js: "
                $('#imes_d238h_customer_id').val('#{rows.first.kunnr}');
                $('#imes_d238h_customer_name').val('#{rows.first.name1}');
               "
    else
      render js: "
                $('#imes_d238h_customer_id').val('');
                $('#imes_d238h_customer_name').val('');
                alert('#{I18n.t('attributes.customer_id')} Error');
                $('#imes_d238h_customer_id').focus();
               "
    end

  end

  def str_qhlc
    @imes_d238h = Imes::D238h.find(params[:bdbh])
    array = []
    array = array + params[:caigou].split(',') if params[:caigou].present?
    array = array + params[:yanfa].split(',') if params[:yanfa].present?
    array = array + params[:zhihui].split(',') if params[:zhihui].present?
    array = array + params[:shenhe].split(',') if params[:shenhe].present?
    array = array + params[:hezhun].split(',') if params[:hezhun].present?

    hash = User.validate_mail_id(array)
    if hash.values.include?('NG')
      list = []
      hash.keys.each do |key|
        list.append key if hash[key].eql?('NG')
      end
      @user_error = "#{list.join(',')} 審核名字不存在, 請更改!"
      render :new
    else
      @imes_d238h.str_qhlc(params)
      redirect_to @imes_d238h
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imes_d238h
      @imes_d238h = Imes::D238h.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imes_d238h_params
      params.require(:imes_d238h).permit(:company_site, :required_department, :applicant, :sro_no, :customer_name, :customer_id, :lei_design_no, :asset_code, :apply_date, :beneficiary, :charge_code, :electronic_engineer, :electronic_engineer_ext, :mechanical_engineer, :mechanical_engineer_ext, :cavity_quantity, :tooling_life, :ee_spec, :power_application, :currency, :target_price, :est_qty, :est_product_life, :est_cost, :gross_profit, :lei_drawing, :tooling_schedule, :tooling_drawing, :approval_record, :est_delivery_date, :required_sample_amount, :required_sample_color, :new_tooling_proposal, :apply_item, :tooling_category, :ac_pin, :payment_provider, :est_tooling_charge, :est_safty_charge, :est_profit_after_1st_year, :verification_requirement, :m_e_department, :specified_material, :attachment, :purchasing_department, :supplier, :reason, :attachment01, :tooling_material, :min_life_cycle_tooling, :related_cost, :tooling_cost, :unit_price, :est_tooling_schedule, :t1, :ppr, :mp, :execution_requirement, :me_en_department, :open_tooling_date, :verification_status, :fail_reason_desc, :attachment11, :lei_p_n, :c_e_department, :approval_date, :attachment1, :verification_status, :fail_reason, :component_approval_code, :purchasing_department, :approval_date, :attachment21, :approval_schedule, :sales_department, :est_payment_date, :est, :payment1, :actual_payment_receipt_date, :actual, :payment2, :est_forecasted_demand, :actual_demand, :cus_pay_amount, :cus_pay_accrued_into, :lei_pay_amount, :lei_pay_accrued_into, :gsdm, :bddm, :bdbh, :bdrq, :bdzt, :qhyh, :qhsj, :yxsj, :jlyh, :jlsj, :gxyh, :gxsj, :bdjg, :bdfd, {:production_site => []})
    end
end
