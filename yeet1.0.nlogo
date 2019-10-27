extensions [ gis array table csv ]

globals [ landcover-gis household-gis original-land-type land-dataset p-set h-set r-set t-set c-set ru-set f-set s-set patch-list SNAKE-NAMES
habitat-list january-rainfall february-rainfall march-rainfall april-rainfall may-rainfall june-rainfall july-rainfall august-rainfall
september-rainfall october-rainfall november-rainfall december-rainfall DENSITY
cobra-density russels-viper-density saw-scaled-viper-density tree-viper-density common-krait-density ceylon-krait-density hump-nosed-viper-density
month daytime round-number
cobra-habitat-condition russels-viper-habitat-condition saw-scaled-viper-habitat-condition tree-viper-habitat-condition common-krait-habitat-condition
ceylon-krait-habitat-condition hump-nosed-viper-habitat-condition
cobra-daily-activity russels-viper-daily-activity saw-scaled-viper-daily-activity tree-viper-daily-activity common-krait-daily-activity ceylon-krait-daily-activity
hump-nosed-viper-daily-activity
cobra-radious russels-viper-radious saw-scaled-viper-radious tree-viper-radious common-krait-radious ceylon-krait-radious hump-nosed-viper-radious
HOUSEHOLD-NAME household-list
rice-ha tea-ha orchid-ha rubber-ha home-ha forest-ha
cobra-agressivness russels-viper-agressivness saw-scaled-viper-agressivness tree-viper-agressivness common-krait-agressivness ceylon-krait-agressivness hump-nosed-viper-agressivness
data
number-of-attack
total-cobra population
previous-percipitation
work-patch

loc
map-resolution

  snakeplot

this-farming-size rice-size tea-size

 rice-multiplier tea-multiplier

 rice-schedule tea-schedule

 rice-hours tea-hours

 cobra-report

 total-rice-snakes
 total-tea-snakes
 total-rubber-snakes
 total-forest-snakes
 total-home-snakes

 monthly-activity-factor

 snakes-set


 dif-forest-cobra dif-rubber-cobra  dif-rice-cobra dif-home-cobra  dif-tea-cobra
 forest-cobra rubber-cobra  rice-cobra home-cobra  tea-cobra

 dif-forest-russels-viper dif-rubber-russels-viper  dif-rice-russels-viper dif-home-russels-viper  dif-tea-russels-viper
 forest-russels-viper rubber-russels-viper  rice-russels-viper home-russels-viper  tea-russels-viper

 dif-forest-saw-scaled-viper dif-rubber-saw-scaled-viper  dif-rice-saw-scaled-viper dif-home-saw-scaled-viper  dif-tea-saw-scaled-viper
 forest-saw-scaled-viper rubber-saw-scaled-viper  rice-saw-scaled-viper home-saw-scaled-viper  tea-saw-scaled-viper

 dif-forest-tree-viper dif-rubber-tree-viper  dif-rice-tree-viper dif-home-tree-viper  dif-tea-tree-viper
 forest-tree-viper rubber-tree-viper  rice-tree-viper home-tree-viper  tea-tree-viper

 dif-forest-common-krait dif-rubber-common-krait  dif-rice-common-krait dif-home-common-krait  dif-tea-common-krait
 forest-common-krait rubber-common-krait  rice-common-krait home-common-krait  tea-common-krait

 dif-forest-ceylon-krait dif-rubber-ceylon-krait  dif-rice-ceylon-krait dif-home-ceylon-krait  dif-tea-ceylon-krait
 forest-ceylon-krait rubber-ceylon-krait  rice-ceylon-krait home-ceylon-krait  tea-ceylon-krait

 dif-forest-hump-nosed-viper dif-rubber-hump-nosed-viper  dif-rice-hump-nosed-viper dif-home-hump-nosed-viper  dif-tea-hump-nosed-viper
 forest-hump-nosed-viper rubber-hump-nosed-viper  rice-hump-nosed-viper home-hump-nosed-viper  tea-hump-nosed-viper

 cobra-cc
 russels-viper-cc
 saw-scaled-viper-cc
 tree-viper-cc
 common-krait-cc
 ceylon-krait-cc
 hump-nosed-viper-cc
 human-dens-map


snakebites

  SF

  human-pop-density

  cobra-k russsels-viper-k saw-scaled-viper-k tree-viper-k common-krait-k ceylon-krait-k hump-nosed-viper-k

  house-number-count

  rubber-intensity-index
  tea-intensity-index
  rice-intensity-index

  percentage-of-working-farmers

   cbr-rice
   hnv-rice
   rv-rice
   tv-rice
   krt-rice
   c-krt-rice
   ssv-rice
   hm-rice
   snk-rice
  cbr-tea
   hnv-tea
   rv-tea
   tv-tea
   krt-tea
   c-krt-tea
   ssv-tea
   snk-tea
   hm-tea
  cbr-rubber
   hnv-rubber
   rv-rubber
   tv-rubber
   krt-rubber
   c-krt-rubber
   ssv-rubber
   snk-rubber
   hm-rubber

  cbr-agent
  hnv-agent
  rv-agent
  tv-agent
  krt-agent
  c-krt-agent
  ssv-agent

  rice-patch
  tea-patch
  rubber-patch
  forest-patch
  home-patch

  region

  map-type

  killing-probability

  birth-rate


]

patches-own [land-type land-type-vector vegetation ID checked? ownership-id]

breed [snakes snake]
breed [houses house]
breed [farmers farmer]

snakes-own [name active? seasonal-active? activity-checked? where-i-am]
farmers-own [land-ownership farmer-number house-number moved? farmer-type working? working-checked? starting-hour schedule selected? where-i-am]

houses-own [household-number household-size house-type]




to setup
  clear-all
  reset-ticks

  set loc "eheliyagoda/1"
  set map-type "sentinal"
  set map-resolution 10

  ;opening csv file
  file-close-all

  if file-exists? (word loc "/snakebites_output.txt") [
    file-delete (word loc "/snakebites_output.txt")]
  if file-exists? (word loc "/snakebites_output_weather.txt") [
    file-delete (word loc "/snakebites_output_weather.txt") ]
  if file-exists? (word loc "/snakebites_output_snakes.txt") [
    file-delete (word loc "/snakebites_output_snakes.txt")]
  if file-exists? (word loc "/population_reporters.txt") [
    file-delete (word loc "/population_reporters.txt")]


  ;file-open "locations/farmers1.csv"

  set data csv:from-file (word loc "/population.csv")
  print data
  set cobra-cc item 1 item 1 data
  set russels-viper-cc item 1 item 5 data
  set saw-scaled-viper-cc item 1 item 4 data
  set tree-viper-cc item 1 item 2 data
  set common-krait-cc item 1 item 7 data
  set ceylon-krait-cc item 1 item 6 data
  set hump-nosed-viper-cc item 1 item 3 data
  set human-dens-map item 1 item 8 data
  print human-dens-map





  ;set number-of-attack 0

  ;right now its one order smaller than my calculations from the paper
  ;set SF (364 / 10000000)

  set snakebites 0

  reselect-weather

  set month 1
  set daytime 1
  set round-number 1

  set rice-schedule [0 0 8 8 8 8 0 0 8 8 8 8 0]

  set percentage-of-working-farmers 0.3

  ifelse real-population = TRUE [
  set human-pop-density human-dens-map
  ][
  ifelse real-population = FALSE [
  set human-pop-density population-of-location
  ][
  ]]


  ;set population density and also I need to figure out hout to decide the densities according to seasonality
  set cobra-density (cobra-cc * ( 1 * (10 ^ 10)))
  set russels-viper-density (russels-viper-cc * (1 * (10 ^ 10)))
  set saw-scaled-viper-density (saw-scaled-viper-cc * (1 * (10 ^ 10)))
  set tree-viper-density (tree-viper-cc * (1 * (10 ^ 10)))
  set common-krait-density (common-krait-cc * (1 * (10 ^ 10)))
  set ceylon-krait-density (ceylon-krait-cc * (1 * (10 ^ 10)))
  set hump-nosed-viper-density (hump-nosed-viper-cc * (1 * (10 ^ 10)))

  ; 0 - forest    1 - rubber    2 - rice    3 - home\orchid    4 - tea
  set cobra-habitat-condition [.653 .895 1.352 5.209 .387]
  set russels-viper-habitat-condition [0.573 0.953 1.440 5.599 0]
  set saw-scaled-viper-habitat-condition [0.391 0.408 2.429 4.585 0]
  set tree-viper-habitat-condition [1.051 0.947 0.235 2.269 0.777]
  set common-krait-habitat-condition [0.722 1.012 1.289 4.277 0]
  set ceylon-krait-habitat-condition [0.825 1.087 0 24.92 1.27]
  set hump-nosed-viper-habitat-condition [0.929 0.976 0.348 2.472 1.387]


  set cobra-daily-activity [0 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2]
  set russels-viper-daily-activity [0 .5 .5 .5 .5 .5 .5 0.25 0.15 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.15 0.25 .5 .5 .5 .5 .5 .5 .5]
  set saw-scaled-viper-daily-activity [0 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2]
  set tree-viper-daily-activity [0 .5 .5 .5 .5 .5 .5 0.25 0.15 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.15 0.25 .5 .5 .5 .5 .5 .5 .5]
  set common-krait-daily-activity [0 .5 .5 .5 .5 .5 .5 0.25 0.15 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.15 0.25 .5 .5 .5 .5 .5 .5 .5]
  set ceylon-krait-daily-activity [0 .5 .5 .5 .5 .5 .5 0.25 0.15 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.15 0.25 .5 .5 .5 .5 .5 .5 .5]
  set hump-nosed-viper-daily-activity [0 .5 .5 .5 .5 .5 .5 0.25 0.15 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.15 0.25 .5 .5 .5 .5 .5 .5 .5]




  set cobra-radious 1
  set russels-viper-radious 1
  set saw-scaled-viper-radious 1
  set tree-viper-radious 1
  set common-krait-radious 1
  set ceylon-krait-radious 1
  set hump-nosed-viper-radious 1

  ;;;;; hecters per hour for each landcover type
  set rice-ha 0
  set tea-ha 0
  set rubber-ha 0
  set orchid-ha 0
  set home-ha 0
  set forest-ha 0

  ifelse weighted-agreesivness = false [
  set cobra-agressivness 3
  set russels-viper-agressivness 3
  set saw-scaled-viper-agressivness 3
  set tree-viper-agressivness 3
  set common-krait-agressivness 3
  set ceylon-krait-agressivness 3
  set hump-nosed-viper-agressivness 3
  ][
  ifelse weighted-agreesivness = true [
  set cobra-agressivness 5
  set russels-viper-agressivness 8
  set saw-scaled-viper-agressivness 10
  set tree-viper-agressivness 6
  set common-krait-agressivness 2
  set ceylon-krait-agressivness 1
  set hump-nosed-viper-agressivness 10

  ][
  ]]




  load-gis-coord
  show ("finish load-gis-coord")
  initialize-patches
  show ("finish initialize-patches")
  ;load-vector-dataset
  ;load-households
  ;setup farmers on households
  ;setup-households

  set HOUSEHOLD-NAME [ 0 1 2 3 4 5]
  set SNAKE-NAMES (list "cobra" "russels-viper" "saw-scaled-viper" "tree-viper" "common-krait" "ceylon-krait" "hump-nosed-viper")
  set habitat-list []

  define-habitat-patches

  foreach SNAKE-NAMES [ x ->
    initialize-snakes-2 x
  ]

  ;foreach HOUSEHOLD-NAME [ x ->
  ;  setup-households x]

  create-household

  ;create agent-set for snakes
  set cbr-agent snakes with [name = "cobra"]
  set hnv-agent snakes with [name = "hump-nosed-viper"]
  set rv-agent snakes with [name = "russels-viper"]
  set tv-agent snakes with [name = "tree-viper"]
  set krt-agent snakes with [name = "common-krait"]
  set c-krt-agent snakes with [name = "ceylon-krait"]
  set ssv-agent snakes with [name = "saw-scaled-vipe"]

  set rice-patch patches with [land-type = "rice"]
  set tea-patch patches with [land-type = "tea"]
  set rubber-patch patches with [land-type = "rubber"]
  set forest-patch patches with [land-type = "forest"]
  set home-patch patches with [land-type = "home"]

  ;divide-farmers        #not needed instead we use create-work-schedule

  ;load-vector-dataset

  init-outputs

  ;assign-work-schedule   #not needed instead we use create-work-schedule

  setup-matrix

  moving-matrix

  creat-work-scheudle

  population-reporters


  ;report-snakes-by-lluc

  show ("setup complete")

end



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;; functions for 'setup'
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to load-gis-coord
  ifelse map-resolution = 10 [
  ;; --- Get height & width from coord and size of raster dataset
  ;gis:load-coordinate-system "tiles/0015/0015.prj"
  set landcover-gis    gis:load-dataset (word loc "/1.asc")
  gis:set-world-envelope (gis:envelope-of landcover-gis)
  let width floor (gis:width-of landcover-gis)
  let height floor (gis:height-of landcover-gis)
  resize-world (-1 * width) width (-1 * height) height
    set-patch-size 2
  ][
  ifelse map-resolution = 30 [
    ;; --- Get height & width from coord and size of raster dataset
  ;gis:load-coordinate-system "tiles/0015/0015.prj"
  set landcover-gis    gis:load-dataset (word loc "/1.asc")
  gis:set-world-envelope (gis:envelope-of landcover-gis)
  let width floor (gis:width-of landcover-gis)
  let height floor (gis:height-of landcover-gis)
  resize-world (-1 * width) width (-1 * height) height
    set-patch-size 5
    ][
  ]]


end



;to load-households
;
;  set household-list no-patches
;  set household-gis gis:load-dataset "location 2/houses.shp"
;  set household-list gis:feature-list-of household-gis
;
; ; let n 1
;  foreach household-list [x ->
;    let location gis:location-of (first (first (gis:vertex-lists-of x)))
;    create-houses 1 [
;        setxy (item 0 location) (item 1 location)
;        set shape "house"
;        set color blue
;        set size 3
;        set household-number (gis:property-value x "id")
;        set household-size (gis:property-value x "size")
;  ]]
;end




;to setup-households [this-number]
;
;  ask houses with [household-number = this-number] [
;    let n 1
;    let csv-number-1 0
;    let csv-number-2 0
;    set csv-number-1 household-number
;    repeat (household-size)[
;    hatch-farmers 1
;    [set color red
;     set size 3
;      set shape "person"
;      set farmer-number n
;      set csv-number-2 farmer-number
;      set data csv:from-file (word "location 2/" csv-number-1 "-" csv-number-2 ".csv")
;      ;show data
;      set land-ownership data
;      set n n + 1
;  ] ] ]
;
;end

to create-household

  set house-number-count 1


  repeat (human-pop-density / 4 ) [


  create-houses 1 [
        setxy random-xcor random-ycor
        set shape "house"
        set color blue
        set size 3
        set household-number house-number-count
        ifelse map-resolution = 10 [
        ask patches in-radius 3 [
      set original-land-type "home"
      set land-type original-land-type
      set pcolor orange]
      ][
        ifelse map-resolution = 30 [
          ask patches in-radius 3 [
      set original-land-type "home"
      set land-type original-land-type
      set pcolor orange]
      ][
      ]]
      ;ask neighbors [ set original-land-type "home"
      ;set land-type original-land-type
      ;set pcolor orange]
        hatch-farmers 4
    [set color pink
      set size 3
      set shape "person"
      set house-number house-number-count
      ]

      set house-number-count (house-number-count + 1)
    ]

  ]





end





to initialize-patches
  ask patches [
    ;set owner-id -1
    set vegetation 0
    ;set pcolor Nodata-color
    set original-land-type "NoData"
    ;set land-type "NoData"
    set checked? FALSE
    ;set deforested? FALSE
    ;set min-distance 0
    ;set buf6 0
    ;set buf12 0
  ]
  gis:apply-raster landcover-gis vegetation

  ;joes map means the entire country classification map
 ifelse map-type = "joes-map" [
  ask patches [
    ifelse (vegetation = 1) [
      set original-land-type "water"
      set land-type original-land-type
      set pcolor black
    ][
    ifelse (vegetation = 2) [
      set original-land-type "forest"
      set land-type original-land-type
      set pcolor green
    ][
    ifelse (vegetation = 3) [
      set original-land-type "rubber"
      set land-type original-land-type
      set pcolor yellow
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 4) [
      set original-land-type "rice"
      set land-type original-land-type
      set pcolor red
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 5) [
      set original-land-type "home"
      set land-type original-land-type
      set pcolor orange
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 6) [
      set original-land-type "tea"
      set land-type original-land-type
      set pcolor blue
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 7) [
      set original-land-type "water"
      set land-type original-land-type
      set pcolor black
      ;set countdown TIME-TO-REVEGETATE
    ][
    ]]]]]]]
  ]

    ][
    ;my map means the landsat classification map for ratnapura region
    ifelse map-type = "my-map" [
       ask patches [
    ifelse (vegetation = 1) [
      set original-land-type "tea"
      set land-type original-land-type
      set pcolor blue
    ][
    ifelse (vegetation = 2) [
      set original-land-type "rice"
      set land-type original-land-type
      set pcolor red
    ][
    ifelse (vegetation = 3) [
      set original-land-type "forest"
      set land-type original-land-type
      set pcolor green
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 4) [
      set original-land-type "forest"
      set land-type original-land-type
      set pcolor green
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 5) [
      set original-land-type "rubber"
      set land-type original-land-type
      set pcolor yellow
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 6) [
      set original-land-type "home"
      set land-type original-land-type
      set pcolor orange
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 7) [
      set original-land-type "water"
      set land-type original-land-type
      set pcolor black
      ;set countdown TIME-TO-REVEGETATE
    ][
    ]]]]]]]
  ]
    ][

      ;there are the two sentinal maps joe made before he left
      ifelse map-type = "sentinal" [
       ask patches [
    ifelse (vegetation = 1) [
      set original-land-type "rubber"
      set land-type original-land-type
      set pcolor yellow
    ][
    ifelse (vegetation = 2) [
      set original-land-type "water"
      set land-type original-land-type
      set pcolor black
    ][
    ifelse (vegetation = 3) [
      set original-land-type "forest"
      set land-type original-land-type
      set pcolor green
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 4) [
      set original-land-type "rice"
      set land-type original-land-type
      set pcolor red
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 5) [
      set original-land-type "tea"
      set land-type original-land-type
      set pcolor blue
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 6) [
      set original-land-type "home"
      set land-type original-land-type
      set pcolor orange
      ;set countdown TIME-TO-REVEGETATE
    ][
    ifelse (vegetation = 7) [
      set original-land-type "water"
      set land-type original-land-type
      set pcolor black
      ;set countdown TIME-TO-REVEGETATE
    ][
    ]]]]]]]
  ]
      ][
  ]]]

end


;to load-vector-dataset  ;;;drawing shapefile and setting centroids for each shapefile
;
;  set p-set no-patches
;  set h-set no-patches
;  set r-set no-patches
;  set t-set no-patches
;  set c-set no-patches
;  set ru-set no-patches
;  set f-set no-patches
;  set s-set no-patches

;  set land-dataset gis:load-dataset "location 2/location22.shp"


;    gis:set-drawing-color red
;    gis:draw land-dataset .5

  ;;;adding centroids to the patch
  ;let n 1
  ;foreach gis:feature-list-of land-dataset [ vector-feature ->
  ;let center-point gis:location-of gis:centroid-of vector-feature
  ;  ask patch item 0 center-point item 1 center-point [
  ;   ;setting the centroid id number
  ;    set ID n
  ;    ;; seting the centroid landcover type
  ;    if gis:property-value vector-feature "LC_ID" = 1
  ;    [set land-type "forest"
  ;    set h-set (patch-set h-set self)]
  ;    if gis:property-value vector-feature "LC_ID" = 2
  ;    [set land-type "rubber"
  ;    set r-set (patch-set r-set self)]
  ;    if gis:property-value vector-feature "LC_ID" = 3
  ;    [set land-type "orchad"
  ;    set t-set (patch-set t-set self)]
  ;    if gis:property-value vector-feature "LC_ID" = 4
  ;    [set land-type "home"
  ;    set c-set (patch-set c-set self)]
  ;    if gis:property-value vector-feature "LC_ID" = 5
  ;    [set land-type "rice"
  ;    set ru-set (patch-set ru-set self)]
  ;    if gis:property-value vector-feature "LC_ID" = 6
  ;    [set land-type "tea"
  ;    set f-set (patch-set f-set self)]
  ;    if gis:property-value vector-feature "LC_ID" = 7
  ;    [set land-type "water"
  ;    set s-set (patch-set s-set self)]

      ;creating a list of all patches
  ;    set p-set (patch-set p-set self)

;  ]
;    set n n + 1]

;    let n 1
;  foreach gis:feature-list-of land-dataset [ vector-feature ->
;  let candidates patches gis:intersecting vector-feature
;    ask candidates [
     ;setting the centroid id number
;      set ID n
;      set ownership-id gis:property-value  vector-feature "ID_NUMBER"]

      ;creating a list of all patches
      ;set p-set (patch-set p-set self)


;    set n n + 1]

;end


;to initialize-snakes [this-name]

;  let this-color "brown"
;  let this-habitat-type (list "forest")
;  let suitable? FALSE
;  let candidate nobody
;  let this-patch nobody
;  let this-habitat-size 1
;  let number-of-animals 0
;  let this-density 1
;  let association-factor []
;  let home-range 0


;  ifelse this-name = "cobra" [
;    set-default-shape snakes "box"
;    set this-color brown
;    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
;    set this-density cobra-density
;    set association-factor cobra-habitat-condition
;    set home-range cobra-radious

;  ][
;  ifelse this-name = "russels-viper" [
;    set-default-shape snakes "box"
;    set this-color blue
;    set this-habitat-type (list "forest" "rubber" "rice" "home")
;    set this-density russels-viper-density
;    set association-factor russels-viper-habitat-condition
;    set home-range russels-viper-radious

;  ][
;  ifelse this-name = "saw-scaled-viper" [
;    set-default-shape snakes "box"
;    set this-color yellow
;    set this-habitat-type (list "forest" "rubber" "rice" "home")
;    set this-density saw-scaled-viper-density
;    set association-factor saw-scaled-viper-habitat-condition
;    set home-range saw-scaled-viper-radious

;  ][
;  ifelse this-name = "tree-viper" [
;    set-default-shape snakes "box"
;    set this-color blue
;    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
;    set this-density tree-viper-density
;    set association-factor tree-viper-habitat-condition
;    set home-range tree-viper-radious

;  ][
;  ifelse this-name = "common-krait" [
;    set-default-shape snakes "box"
;    set this-color white
;    set this-habitat-type (list "forest" "rubber" "rice" "home")
;    set this-density common-krait-density
;    set association-factor common-krait-habitat-condition
;    set home-range common-krait-radious

;  ][
;  ifelse this-name = "ceylon-krait" [
;    set-default-shape snakes "box"
;    set this-color white
;    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
;    set this-density ceylon-krait-density
;    set association-factor ceylon-krait-habitat-condition
;    set home-range ceylon-krait-radious

;  ][
;  ifelse this-name = "hump-nosed-viper" [
;    set-default-shape snakes "box"
;    set this-color yellow
;    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
;    set this-density hump-nosed-viper-density
;    set association-factor hump-nosed-viper-habitat-condition
;    set home-range hump-nosed-viper-radious

;  ][
;]]]]]]]

; foreach habitat-list [ x ->
;    set candidate one-of patch-set x
;
;    if any? candidate [
;      sprout-snakes 1
;      [
;        set shape "box"
;        set color white
;        set size 5]]]


;foreach habitat-list [ x ->
;    set suitable? FALSE
;    set candidate one-of patch-set x
;    set this-habitat-size count (patch-set x)
;    let land-factor 0

;    if (member? ([land-type] of candidate) this-habitat-type) AND (1 < this-habitat-size) [set suitable? TRUE]
;    if suitable? [

;      ifelse ([land-type] of candidate) = "forest" [set land-factor item 0 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "rubber" [set land-factor item 1 association-factor
;    ][
;       ifelse ([land-type] of candidate) = "rice" [set land-factor item 2 association-factor
;    ][
;       ifelse ([land-type] of candidate) = "home" [set land-factor item 3 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "orchid" [set land-factor item 3 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "water" [set land-factor item 4 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "tea" [set land-factor item 4 association-factor
;    ][
;    ]]]]]]]

;      let candidates patch-set x
;      let non-candidates nobody
;;      let new-habitat nobody
;      set number-of-animals (this-habitat-size * this-density * land-factor)
;
 ;     repeat number-of-animals [
 ;       if any? candidates [
 ;         create-snakes 1 [
 ;           set name this-name
;            ;set dispersal? FALSE
;            set color this-color  ;; for display
;            set size 1   ;; for display
;            set DENSITY this-density
;;            ;set R this-r
;            ;set MAX-POP pop-in-a-patch
;            ;set population MAX-POP
;            ;set herd-unit this-herd-unit
;            ;set weight this-weight
;            ;set meat-Kg (this-weight * ANIMAL-MEAT-RATIO)
;            ;set habitat-type this-habitat-type
;            ;set homerange this-homerange
;            ;set ETH (this-homerange / PLOT-SIZE )
;            ;set dispersal-range floor (this-dispersal-range * 1000 / PLOT-LENGTH)
;            ;set my-habitat patch-set x
;            ;set habitat-size this-habitat-size
;             move-to one-of patch-set candidates
;            set non-candidates candidates in-radius floor ( (sqrt home-range) )    ;;; I need to figure out the function of distnace between snakes
;            set candidates candidates with [not member? self non-candidates]
;            set candidates patch-set candidates
;            if any? candidates [ set candidates candidates with [not any? (animals-here with [name = this-name])] ]
            ;set DISPERSABLE? TRUE
;            ifelse any? (patches in-radius dispersal-range) with [not member? self [my-habitat] of myself] [set DISPERSABLE? TRUE]
;            [ set DISPERSABLE? FALSE ]
;          ]
;        ]
;      ]
;    ]
;  ]

;end


to initialize-snakes-2 [this-name]

  let this-color "brown"
  let this-habitat-type (list "forest")
  let suitable? FALSE
  let candidate nobody
  let this-patch nobody
  let this-habitat-size 1
  let number-of-animals 0
  let this-density 1
  let association-factor []
  let home-range 0


  ifelse this-name = "cobra" [
    set-default-shape snakes "box"
    set this-color brown
    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
    set this-density cobra-density
    set association-factor cobra-habitat-condition
    set home-range cobra-radious

  ][
  ifelse this-name = "russels-viper" [
    set-default-shape snakes "box"
    set this-color blue
    set this-habitat-type (list "forest" "rubber" "rice" "home")
    set this-density russels-viper-density
    set association-factor russels-viper-habitat-condition
    set home-range russels-viper-radious

  ][
  ifelse this-name = "saw-scaled-viper" [
    set-default-shape snakes "box"
    set this-color yellow
    set this-habitat-type (list "forest" "rubber" "rice" "home")
    set this-density saw-scaled-viper-density
    set association-factor saw-scaled-viper-habitat-condition
    set home-range saw-scaled-viper-radious

  ][
  ifelse this-name = "tree-viper" [
    set-default-shape snakes "box"
    set this-color blue
    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
    set this-density tree-viper-density
    set association-factor tree-viper-habitat-condition
    set home-range tree-viper-radious

  ][
  ifelse this-name = "common-krait" [
    set-default-shape snakes "box"
    set this-color white
    set this-habitat-type (list "forest" "rubber" "rice" "home")
    set this-density common-krait-density
    set association-factor common-krait-habitat-condition
    set home-range common-krait-radious

  ][
  ifelse this-name = "ceylon-krait" [
    set-default-shape snakes "box"
    set this-color white
    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
    set this-density ceylon-krait-density
    set association-factor ceylon-krait-habitat-condition
    set home-range ceylon-krait-radious

  ][
  ifelse this-name = "hump-nosed-viper" [
    set-default-shape snakes "box"
    set this-color yellow
    set this-habitat-type (list "forest" "rubber" "tea" "rice" "home")
    set this-density hump-nosed-viper-density
    set association-factor hump-nosed-viper-habitat-condition
    set home-range hump-nosed-viper-radious

  ][
]]]]]]]

  repeat this-density [
       create-snakes 1 [
            set name this-name
            set color this-color  ;; for display
            set size 1   ;; for display
            setxy random-xcor random-ycor
          ]
  ]
end





to define-habitat-patches
  foreach sort patches with [land-type = "forest" or land-type = "rubber" or land-type = "tea"
  or land-type = "home" or land-type = "orchid" or land-type = "rice" or land-type = "water"] [ x ->
    if not [checked?] of x [
      let this-color [pcolor] of x
      let tmp-habitat x
      let x1 [neighbors4] of x
      if any? x1 [set x1 x1 with [pcolor = this-color]]
      if any? x1 [ set tmp-habitat (patch-set tmp-habitat x1) ]
      while [any? x1] [
        set x1 [neighbors4] of x1 ;; make a list of neighbors of x1
        set x1 patch-set x1       ;; change the list to patch-set (this erases duplicates automatically)
        if any? x1 [              ;; check if the set contains habitat-type of the animal
          set x1 x1 with [pcolor = this-color
          ]
        ]
        if any? x1 [
;          foreach sort x1 [
;            if member? ? tmp-habitat [set x1 remove ? sort x1]
;          ]
;          set x1 patch-set x1
          set x1 x1 with [not member? self tmp-habitat]
          if any? x1 [ set tmp-habitat (patch-set tmp-habitat x1)
           ]
        ]
      ]
      ask tmp-habitat [set checked? TRUE]
      set habitat-list lput tmp-habitat habitat-list
    ]
  ]

  let plot-count 1
  foreach habitat-list [ x ->
    ask x [
      set ownership-id plot-count]
    set plot-count plot-count + 1
  ]

end




;to assign-work-schedule
;
;  let farming-type ["rice" "tea" ]
;
;  set rice-size 0
;  set tea-size 0
;
;  foreach farming-type [ x ->
;    set this-farming-size count (patches with  [land-type = x])
;    ifelse x = "rice" [
;      set rice-size this-farming-size
;
;
;      ifelse rice-size = 0 [
;
;        set rice-multiplier 0
;
;      ][
;        ifelse (rice-size < 40000) and (rice-size > 0) [
;
;         set rice-multiplier 1
;
;  ][
;    ifelse (rice-size > 40000) and (rice-size < 80000) [
;
;         set rice-multiplier 2
;
;    ][
;      ifelse rice-size > 80000 [
;
;         set rice-multiplier 3
;
;      ][
;      ]]]]
;
;
;    ][
;    ifelse x = "tea" [
;      set tea-size this-farming-size
;
;        ifelse tea-size = 0 [
;
;        set tea-multiplier 0
;
;      ][
;        ifelse (tea-size < 40000) and (tea-size > 0) [
;
;         set tea-multiplier 1
;
;  ][
;    ifelse (tea-size > 40000) and (tea-size < 80000) [
;
;         set tea-multiplier 2
;
;    ][
;      ifelse tea-size > 80000 [
;
;         set tea-multiplier 3
;
;      ][
;      ]]]]
;      ][
;  ]]
;  ]


;end


;to divide-farmers
;
;
;
;  let number-of-patches-tea count patches with [land-type = "tea"]
;  let number-of-patches-rice count patches with [land-type = "rice"]
;  let number-of-patches-rubber count patches with [land-type = "rubber"]
;
;  let percent-tea-farmers (number-of-patches-tea / (number-of-patches-tea + number-of-patches-rice + number-of-patches-rubber))
;  let percent-rice-farmers (number-of-patches-rice / (number-of-patches-tea + number-of-patches-rice + number-of-patches-rubber))
;  let percent-rubber-farmers (number-of-patches-rubber / (number-of-patches-tea + number-of-patches-rice + number-of-patches-rubber))
;
;  show percent-tea-farmers
;  show percent-rice-farmers
;  show percent-rubber-farmers
;
;  let count-up 1
;
;  repeat house-number-count [
;
;    ifelse (count-up < (house-number-count * percent-tea-farmers)) [
;
;      ask houses with [household-number = count-up] [
;        set house-type "tea"
;      ]
;      ask farmers with [house-number = count-up] [
;        set farmer-type "tea"
;      ]
;    ][
;    ifelse (count-up < ((house-number-count * percent-tea-farmers) + (house-number-count * percent-rice-farmers))) [
;
;      ask houses with [household-number = count-up] [
;        set house-type "rice"
;      ]
;      ask farmers with [house-number = count-up] [
;        set farmer-type "rice"
;      ]
;    ][
;    ifelse (count-up < ((house-number-count * percent-tea-farmers) + (house-number-count * percent-rice-farmers) + (house-number-count * percent-rubber-farmers))) [
;
;      ask houses with [household-number = count-up] [
;        set house-type "rubber"
;      ]
;      ask farmers with [house-number = count-up] [
;        set farmer-type "rubber"
;      ]
;    ][
;    ]]]



;    set count-up count-up + 1
;  ]





;  show (house-number-count * percent-tea-farmers) + (house-number-count * percent-rice-farmers) + (house-number-count * percent-rubber-farmers)
;  show house-number-count


;  ifelse work-division-model = TRUE [
;
;    let dice 0
;    ask farmers [
;      set working-checked?  FALSE
;    ]


;    repeat count farmers [
;      ask one-of farmers with [working-checked? = FALSE] [

;        set dice random-float 1

;        ifelse dice > percentage-of-working-farmers [
;          set working? FALSE
;        ]
;        [
;          set working? TRUE
;        ]

;        set working-checked? TRUE


;      ]
;    ]

;  ]
;  [

;      ask farmers [
;      set working? TRUE
;      ]


;  ]




;end




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;; functions for 'go'
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to go
  tick
  set daytime daytime + 1


  foreach SNAKE-NAMES [ x ->
    update-snake-activity x]

  set-previous-percipitation

  moving-matrix



  ;assign-work    #this was the previous way of moving for work, now transfered to transition matrix
  ;transition-matrix # this is also a previous way of moving, now a work schedule is created per day

  go-working



  population-reporters

  ;move
  kill
  bite


   if (ticks = (288 * number-of-rounds) )[
    stop
   ]






  ifelse (daytime = 24) and (month < 12) [
    set month month + 1
    set daytime 0
    set snakeplot snakebites
    set snakebites 0

    ;set-tea-schedule
    update-snake-density
    ;assign-hours
    snake-seasonal-activity
    ;report-snakes-by-lluc

    creat-work-scheudle


    ;foreach SNAKE-NAMES [ x ->
    ;update-population x]
   ][
  ifelse (month = 12) and (daytime = 24) [
    set month 1
    set daytime 0
    set round-number round-number + 1
    ;update-human-population
    give-birth
    update-snake-density
    ;set-tea-schedule
    reselect-weather
    setup-matrix
    snake-seasonal-activity
    ;report-snakes-by-lluc
    creat-work-scheudle
    ;assign-hours




    ;foreach SNAKE-NAMES [ x ->
    ;update-population x]


][
]]

end




;to update-population [this-name]
;
;  let this-color "brown"
;  let this-habitat-type (list "forest")
;  let suitable? FALSE
;  let candidate nobody
;  let this-patch nobody
;  let this-habitat-size 1
;  let number-of-animals 0
;  let this-density 1
;  let association-factor []
;  let radious 0


;  ifelse this-name = "cobra" [
;    set-default-shape snakes "box"
;    set this-color brown
;    set this-habitat-type (list "forest" "rubber" "tea" "rice" "orchid" "home")
;    set this-density cobra-density
;    set association-factor cobra-habitat-condition
;    set radious cobra-radious
;
;  ][
;  ifelse this-name = "russels-viper" [
;    set-default-shape snakes "box"
;    set this-color blue
;    set this-habitat-type (list "rubber" "tea" "rice" "orchid")
;    set this-density russels-viper-density
;    set association-factor russels-viper-habitat-condition
;    set radious russels-viper-radious

;  ][
;  ifelse this-name = "saw-scaled-viper" [
;    set-default-shape snakes "box"
;    set this-color yellow
;    set this-habitat-type (list "rubber" "tea" "rice" "orchid")
;    set this-density item month saw-scaled-viper-density
;    set association-factor saw-scaled-viper-habitat-condition
;    set radious saw-scaled-viper-radious

;  ][
;  ifelse this-name = "tree-viper" [
;    set-default-shape snakes "box"
;    set this-color blue
;    set this-habitat-type (list "forest" "rubber" "tea")
;    set this-density item month tree-viper-density
;    set association-factor tree-viper-habitat-condition
;    set radious tree-viper-radious

;  ][
;  ifelse this-name = "common-krait" [
;    set-default-shape snakes "box"
;    set this-color white
;    set this-habitat-type "home"
;    set this-density item month common-krait-density
;    set association-factor common-krait-habitat-condition
;    set radious common-krait-radious

;  ][
;  ifelse this-name = "ceylon-krait" [
;    set-default-shape snakes "box"
;    set this-color white
;    set this-habitat-type "home"
;    set this-density item month ceylon-krait-density
;    set association-factor ceylon-krait-habitat-condition
;    set radious ceylon-krait-radious

;  ][
;  ifelse this-name = "hump-nosed-viper" [
;    set-default-shape snakes "box"
;    set this-color yellow
;    set this-habitat-type (list "tea" "rice" "orchid")
;    set this-density hump-nosed-viper-density
;    set association-factor hump-nosed-viper-habitat-condition
;    set radious hump-nosed-viper-radious
;  ][
;]]]]]]]



;foreach habitat-list [ x ->
;    set suitable? FALSE
;    set candidate one-of patch-set x
;    set this-habitat-size count (patch-set x)
;    let land-factor 0

;    if (member? ([land-type] of candidate) this-habitat-type) AND (1 < this-habitat-size) [set suitable? TRUE]  ;;100 is a random number but I need to figure out what habitat size can support snakes
;    if suitable? [


      ;;;retrieving the assofication factor between snake and habitat according to gerardos model

;      ifelse ([land-type] of candidate) = "forest" [set land-factor item 0 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "rubber" [set land-factor item 1 association-factor
;    ][
;       ifelse ([land-type] of candidate) = "rice" [set land-factor item 2 association-factor
;    ][
;       ifelse ([land-type] of candidate) = "home" [set land-factor item 3 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "orchid" [set land-factor item 3 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "water" [set land-factor item 4 association-factor
;    ][
;      ifelse ([land-type] of candidate) = "tea" [set land-factor item 4 association-factor
;    ][
;    ]]]]]]]

    ; show land-factor


;      let candidates patch-set x
;      let non-candidates nobody
;      let new-habitat nobody
;      set number-of-animals (this-habitat-size * this-density * land-factor)


;      let snakes-on-specific-patch nobody
;      set snakes-on-specific-patch count (snakes-on candidates) with [name = this-name]
;      let previous-number-of-animals 0
;      set previous-number-of-animals snakes-on-specific-patch


;      let difference-in-population 0
;      set difference-in-population (number-of-animals - previous-number-of-animals)

      ;if (difference-in-population > 0 AND difference-in-population < 1) [
      ;  set difference-in-population random 2]

;      set difference-in-population floor difference-in-population

      ;show difference-in-population




;      ifelse (difference-in-population > 0) [
;      repeat difference-in-population [
;        if any? candidates [
;          create-snakes 1 [
;            set name this-name
;            ;set dispersal? FALSE
;            set color this-color  ;; for display
;            set size 1   ;; for display
;            set DENSITY this-density
;            ;set R this-r
;            ;set MAX-POP pop-in-a-patch
;            ;set population MAX-POP
;            ;set herd-unit this-herd-unit
;            ;set weight this-weight
;            ;set meat-Kg (this-weight * ANIMAL-MEAT-RATIO)
;            ;set habitat-type this-habitat-type
;            ;set homerange this-homerange
;            ;set ETH (this-homerange / PLOT-SIZE )
;            ;set dispersal-range floor (this-dispersal-range * 1000 / PLOT-LENGTH)
;            ;set my-habitat patch-set x
;            ;set habitat-size this-habitat-size
;            move-to one-of patch-set candidates
;            set non-candidates candidates in-radius floor ( (radious) )    ;;; I need to figure out the function of distnace between snakes
;            set candidates candidates with [not member? self non-candidates]
;            set candidates patch-set candidates
            ;show candidates
;            if any? candidates [ set candidates candidates with [not any? (animals-here with [name = this-name])] ]
            ;set DISPERSABLE? TRUE
;            ifelse any? (patches in-radius dispersal-range) with [not member? self [my-habitat] of myself] [set DISPERSABLE? TRUE]
;            [ set DISPERSABLE? FALSE ]
;          ]
;        ]
;      ]
;    ][

;      ifelse (difference-in-population < 0)
;      [
;       let this-snakes nobody
;       repeat ( -1 * difference-in-population) [
;           set this-snakes (snakes-on candidates) with [name = this-name]
;           ;show this-snakes
;           if any? this-snakes
;          [
;              ask one-of this-snakes [die]
;          ]]
;        ][
;        ]
;      ]
;    ]
;  ]



;end


to update-snake-activity [this-name]


  let number-of-this-snake 0
  let dice 0

  ask snakes [
    set activity-checked? false]



  ifelse this-name = "cobra" [

    set number-of-this-snake count cbr-agent

    repeat number-of-this-snake [

    set dice random-float 1


    ifelse item daytime cobra-daily-activity > dice
    [ask one-of cbr-agent with [activity-checked? = false] [
        set active? TRUE
        set activity-checked? true]
    ][
    ifelse item daytime cobra-daily-activity < dice
      [ask one-of cbr-agent with [activity-checked? = false] [
        set active? FALSE
        set activity-checked? true]
      ][
    ]]
    ]
  ][
  ifelse this-name = "russels-viper" [
     set number-of-this-snake count rv-agent

    repeat number-of-this-snake [

    set dice random-float 1


    ifelse item daytime russels-viper-daily-activity > dice
    [ask one-of rv-agent with [activity-checked? = false] [
        set active? TRUE
        set activity-checked? true]
    ][
    ifelse item daytime russels-viper-daily-activity < dice
      [ask one-of rv-agent with [activity-checked? = false] [
        set active? FALSE
        set activity-checked? true]
      ][
    ]]
    ]
  ][
  ifelse this-name = "saw-scaled-viper" [
        set number-of-this-snake count ssv-agent

    repeat number-of-this-snake [

    set dice random-float 1


    ifelse item daytime saw-scaled-viper-daily-activity > dice
    [ask one-of ssv-agent with [activity-checked? = false] [
        set active? TRUE
        set activity-checked? true]
    ][
    ifelse item daytime russels-viper-daily-activity < dice
      [ask one-of ssv-agent with [activity-checked? = false] [
        set active? FALSE
        set activity-checked? true]
      ][
    ]]
    ]
  ][
  ifelse this-name = "tree-viper" [
       set number-of-this-snake count tv-agent

    repeat number-of-this-snake [

    set dice random-float 1


    ifelse item daytime tree-viper-daily-activity > dice
    [ask one-of tv-agent with [activity-checked? = false] [
        set active? TRUE
        set activity-checked? true]
    ][
    ifelse item daytime tree-viper-daily-activity < dice
      [ask one-of tv-agent with [activity-checked? = false] [
        set active? FALSE
        set activity-checked? true]
      ][
    ]]
    ]
  ][
  ifelse this-name = "common-krait" [
         set number-of-this-snake count krt-agent

    repeat number-of-this-snake [

    set dice random-float 1


    ifelse item daytime common-krait-daily-activity > dice
    [ask one-of krt-agent with [activity-checked? = false] [
        set active? TRUE
        set activity-checked? true]
    ][
    ifelse item daytime common-krait-daily-activity < dice
      [ask one-of krt-agent with [activity-checked? = false] [
        set active? FALSE
        set activity-checked? true]
      ][
    ]]
    ]
  ][
  ifelse this-name = "ceylon-krait" [
        set number-of-this-snake count c-krt-agent

    repeat number-of-this-snake [

    set dice random-float 1


    ifelse item daytime ceylon-krait-daily-activity > dice
    [ask one-of c-krt-agent with [activity-checked? = false] [
        set active? TRUE
        set activity-checked? true]
    ][
    ifelse item daytime ceylon-krait-daily-activity < dice
      [ask one-of c-krt-agent with [activity-checked? = false] [
        set active? FALSE
        set activity-checked? true]
      ][
    ]]
    ]
  ][
  ifelse this-name = "hump-nosed-viper" [
set number-of-this-snake count hnv-agent

    repeat number-of-this-snake [

    set dice random-float 1


    ifelse item daytime hump-nosed-viper-daily-activity > dice
    [ask one-of hnv-agent with [activity-checked? = false] [
        set active? TRUE
        set activity-checked? true]
    ][
    ifelse item daytime hump-nosed-viper-daily-activity < dice
      [ask one-of hnv-agent with [activity-checked? = false] [
        set active? FALSE
        set activity-checked? true]
      ][
    ]]
    ]
  ][
]]]]]]]

end



;to move



;      ask farmers [

;      let ownership-number_month item month land-ownership
;      let ownership-number item (daytime - 1) ownership-number_month
;      ;show ownership-number
;      move-to one-of patches with [ ownership-id = ownership-number]]

;      ask farmers [
;    let ownership-number_month item month land-ownership
;      let ownership-number item (1) ownership-number_month
;    set work-patch item (1) ownership-number_month
;    set home-patch item (0) ownership-number_month



;  ]



;end


to bite

 let human-range 0
 let loc-prob 0

 ifelse map-type = "my-map" [
    set loc-prob random 91
  ][
  ifelse map-type = "joes-map" [
    set loc-prob random 91
  ][
  ifelse map-type = "sentinal" [
    set loc-prob random 11
  ][
  ]]]


 if (loc-prob > (loc-prob - 2))[

 ask farmers [
    ifelse ([land-type] of patch-here = "rice") [
      set human-range rice-ha
      if any? snakes-on patches in-radius human-range  [
        let attacker one-of snakes-on patches in-radius human-range
        ;let attacker-name attacker name

        let attacker-name ([name] of attacker)

        if [active?] of attacker = TRUE and [seasonal-active?] of attacker = TRUE [

            attacker-function attacker-name]

      ]
    ][
     ifelse ([land-type] of patch-here = "tea") [
      set human-range tea-ha
        if any? snakes-on patches in-radius human-range [

          let attacker one-of snakes-on patches in-radius human-range
        ;let attacker-name attacker name

        let attacker-name ([name] of attacker)

        if [active?] of attacker = TRUE and [seasonal-active?] of attacker = TRUE [

            attacker-function attacker-name]

        ]
    ][
     ifelse ([land-type] of patch-here = "rubber") [
      set human-range rubber-ha
          if any? snakes-on patches in-radius human-range [

            let attacker one-of snakes-on patches in-radius human-range
        ;let attacker-name attacker name

        let attacker-name ([name] of attacker)

              if [active?] of attacker = TRUE and [seasonal-active?] of attacker = TRUE [

            attacker-function attacker-name]

      ]
    ][
     ifelse ([land-type] of patch-here = "orchid") [
      set human-range orchid-ha
           if any? snakes-on patches in-radius human-range [

           let attacker one-of snakes-on patches in-radius human-range

           let attacker-name ([name] of attacker)

           if [active?] of attacker = TRUE and [seasonal-active?] of attacker = TRUE [

            attacker-function attacker-name]


            ]
    ][
      ifelse ([land-type] of patch-here = "home") [

              set human-range home-ha
           if any? snakes-on patches in-radius human-range [

           let attacker one-of snakes-on patches in-radius human-range

           let attacker-name ([name] of attacker)

           if [active?] of attacker = TRUE and [seasonal-active?] of attacker = TRUE [

            attacker-function attacker-name]

       ;if any? snakes-on
              ]
    ][
      ifelse ([land-type] of patch-here = "forest") [

                  set human-range forest-ha
           if any? snakes-on patches in-radius human-range [

           let attacker one-of snakes-on patches in-radius human-range

           let attacker-name ([name] of attacker)

           if [active?] of attacker = TRUE and [seasonal-active?] of attacker = TRUE [

            attacker-function attacker-name]
                ]
    ][
    ]]]]]]]

  ]
;
 ;  let victim one-of farmers with [disatnce <
 ; if prey != nobody  [
 ;   ask prey [ die ]
 ;   set energy energy + wolf-gain-from-food
 ; ]]

end


to attacker-function [attacker-name]


  let agressivness 0
  let bite-probability 0
  let snake-activity 0
  let random-probability 0

          ifelse attacker-name = "cobra" [

         set agressivness cobra-agressivness
         ;set snake-activity item daytime cobra-daily-activity
         set bite-probability (agressivness / 10 )
         set random-probability random-float 1
      if (bite-probability > random-probability) [

      file-open (word loc "/snakebites_output.txt")
      file-write "cobra"
      ;file-write farmers number
      file-write [land-type] of patch-here
      file-write daytime
      file-write ","
      file-write month
      file-print ","
      file-write round-number
      file-print ","
      file-close


      set snakebites snakebites + 1

       ]


        ][
        ifelse attacker-name = "russels-viper" [

      set agressivness russels-viper-agressivness
      set bite-probability (agressivness / 10 )
      set random-probability random-float 1
      if (bite-probability > random-probability) [
        write "russels viper"
        show farmers
        show [land-type] of patch-here
        show daytime
        show month
              file-open (word loc "/snakebites_output.txt")
      file-write "russels viper"
      ;file-write farmers number
      file-write [land-type] of patch-here
      file-write daytime
      file-write ","
      file-write month
      file-print ","
      file-write round-number
      file-print ","
      file-close

        set snakebites snakebites + 1

      ]

        ][
        ifelse attacker-name = "saw-scaled-viper" [


        set agressivness saw-scaled-viper-agressivness
      set bite-probability (agressivness / 10  )
      set random-probability random-float 1
      if (bite-probability > random-probability) [
        write "saw scaled viper"
        show farmers
        show [land-type] of patch-here
        show daytime
        show month
                        file-open (word loc "/snakebites_output.txt")
      file-write "saw scaled viper"
      ;file-write farmers number
      file-write [land-type] of patch-here
      file-write daytime
      file-write month
      file-print ","
      file-write round-number
      file-print ","
      file-close

       set snakebites snakebites + 1

      ]

        ][
        ifelse attacker-name = "tree-viper" [

          set agressivness tree-viper-agressivness
      set bite-probability (agressivness / 10  )
      set random-probability random-float 1
      if (bite-probability > random-probability) [
        write "tree viper"
        show farmers
        show [land-type] of patch-here
        show daytime
        show month
                          file-open (word loc "/snakebites_output.txt")
      file-write "tree vipers"
      ;file-write farmers number
      file-write [land-type] of patch-here
      file-write daytime
      file-write month
      file-print ","
      file-write round-number
      file-print ","
      file-close

      set snakebites snakebites + 1

      ]

        ][
        ifelse attacker-name = "common-krait" [

        set agressivness common-krait-agressivness
        set snake-activity item daytime common-krait-daily-activity
        set bite-probability (agressivness / 10 )
      set random-probability random-float 1
      if (bite-probability > random-probability) [
         write "common krait"
         show farmers
        show [land-type] of patch-here
        show daytime
        show month
                            file-open (word loc "/snakebites_output.txt")
      file-write "coommon krait,"
      ;file-write farmers number
      file-write [land-type] of patch-here
      file-write daytime
      file-write month
      file-print ","
      file-write round-number
      file-print ","
      file-close

      set snakebites snakebites + 1


      ]

        ][
        ifelse attacker-name = "ceylon-krait" [

        set agressivness ceylon-krait-agressivness
        set snake-activity item daytime ceylon-krait-daily-activity
        set bite-probability (agressivness / 10  )
         set random-probability random-float 1
         if (bite-probability > random-probability) [
        write "ceylon krait"
        show farmers
        show [land-type] of patch-here
        show daytime
        show month
                              file-open (word loc "/snakebites_output.txt")
      file-write "ceylon krait"
      ;file-write farmers number
      file-write [land-type] of patch-here
      file-write daytime
      file-write month
      file-print ","
      file-write round-number
      file-print ","
      file-close

      set snakebites snakebites + 1


      ]

        ][
        ifelse attacker-name = "hump-nosed-viper" [

         set agressivness hump-nosed-viper-agressivness
         set bite-probability (agressivness / 10  )
      set random-probability random-float 1
      if (bite-probability > random-probability) [
        write "hump nosed viper"
        show farmers
        show [land-type] of patch-here
        show daytime
        show month
                      file-open (word loc "/snakebites_output.txt")
      file-write "hump nosed viper"
      ;file-write farmers number
      file-write [land-type] of patch-here
      file-write daytime
      file-write ","
      file-write month
      file-print ","
      file-write round-number
      file-print ","
      file-close

      set snakebites snakebites + 1


      ]

        ][
        ]]]]]]]

end

;to write-bite-in-csv
;
;
;  set number-of-attack number-of-attack + 1
;end





;to assign-hours

  ;set number of needer hours per month


  ;set for rice

;  set rice-hours (item month rice-schedule) * rice-multiplier * (round(human-pop-density / 4))
;  set tea-hours tea-schedule * tea-multiplier * (round(human-pop-density / 4))


;end

;to assign-work
;
;
;  ask farmers [
;    set moved? false]
;
;  let number-of-hours (rice-hours + tea-hours)
;
;  if number-of-hours > 0 [
;    while [any? farmers with [moved? = false]][
;
;    ifelse (rice-hours > 0) [
;      ask one-of farmers with [moved? = false]
;        [move-to one-of patches with [land-type = "rice"]
;          set moved? true
;          set rice-hours rice-hours - 1]
;    ][
;    ifelse (tea-hours > 0) [
;          ask one-of farmers with [moved? = false]
;        [move-to one-of patches with [land-type = "tea"]
;          set moved? true
;          set tea-hours tea-hours - 1]
;
;          ][
;      ifelse (rice-hours = 0) and (tea-hours = 0) [
;            ask one-of farmers with [moved? = false]
;              [move-to one-of patches with [land-type = "home"]
;                set moved? true]
;              ][
;      ]]]
;
;  ]]
;
;end

;to set-tea-schedule
;
;  ifelse (month < 7) [
;
;   ifelse previous-percipitation < 200 [
;
;    set tea-schedule 2
;
;  ][
;    ifelse (previous-percipitation > 200) and (previous-percipitation < 300) [
;
;      set tea-schedule 4
;
;    ][
;      ifelse (previous-percipitation > 300) and (previous-percipitation < 400 ) [
;
;      set tea-schedule 6
;
;    ][
;        ifelse (previous-percipitation > 400) [
;
;
;          set tea-schedule 8
;
;        ][
;  ]]]]
;  ][
;    ifelse (month >= 7 ) [
;      ifelse previous-percipitation < 200 [
;
;    set tea-schedule 1
;
;  ][
;    ifelse (previous-percipitation > 200) and (previous-percipitation < 300) [
;
;      set tea-schedule 2
;
;    ][
;      ifelse (previous-percipitation > 300) and (previous-percipitation < 400 ) [
;
;      set tea-schedule 4
;
;    ][
;        ifelse (previous-percipitation > 400) [
;
;
;          set tea-schedule 6
;
;        ][
;  ]]]]
;    ][
;  ]]
;
;
;end

to reselect-weather

  ifelse weather = "mean" [
  set january-rainfall ( 111)
  set february-rainfall ( 137)
    set march-rainfall ( 212)
  set april-rainfall ( 338)
  set may-rainfall ( 475)
  set june-rainfall ( 412)
  set july-rainfall ( 292)
  set august-rainfall (304)
  set september-rainfall (421)
  set october-rainfall (436)
  set november-rainfall (371)
  set december-rainfall (235)
  ][
  ifelse weather = "el nino" [
  set january-rainfall (111 + (random-normal -21 28))
  set february-rainfall (137 + (random-normal -21 28))
  set march-rainfall (212 + (random-normal -21 28))
  set april-rainfall (338 + (random-normal 11 35))
  set may-rainfall (475 + (random-normal 34 75))
  set june-rainfall (412 + (random-normal 11 35))
  set july-rainfall (292 + (random-normal -14 29))
  set august-rainfall (304 + (random-normal -14 29))
  set september-rainfall (random-normal 421 56)
  set october-rainfall (436 + (random-normal 43 63))
  set november-rainfall (371 + (random-normal 43 63))
  set december-rainfall (235 + (random-normal 43 63))
    ][
  ifelse weather = "la nina" [
  set january-rainfall (111 + (random-normal -5 38))
  set february-rainfall (137 + (random-normal -5 38))
  set march-rainfall (212 + (random-normal -5 38))
  set april-rainfall (338 + (random-normal -6 29))
  set may-rainfall (475 + (random-normal -21 68))
  set june-rainfall (412 + (random-normal -6 29))
  set july-rainfall (292 + (random-normal 13 31))
  set august-rainfall (304 + (random-normal 13 31))
  set september-rainfall (random-normal 421 56)
  set october-rainfall (436 + (random-normal -26 49))
  set november-rainfall (371 + (random-normal -26 49))
  set december-rainfall (235 + (random-normal -26 49))
      ][
  ifelse weather = "location" [

  set data csv:from-file (word loc "/climate.csv")

  print data


  set january-rainfall (item 1 item 1 data)
  set february-rainfall (item 1 item 2 data)
  set march-rainfall (item 1 item 3 data)
  set april-rainfall (item 1 item 4 data)
  set may-rainfall (item 1 item 5 data)
  set june-rainfall (item 1 item 6 data)
  set july-rainfall (item 1 item 7 data)
  set august-rainfall (item 1 item 8 data)
  set september-rainfall (item 1 item 9 data)
  set october-rainfall (item 1 item 10 data)
  set november-rainfall (item 1 item 11 data)
  set december-rainfall (item 1 item 12 data)
        ][

        ]
  ]]]

      file-open (word loc "/snakebites_output_weather.txt")
      file-write "january ,"
      file-print january-rainfall
      file-write "february ,"
      file-print february-rainfall
      file-write "march ,"
      file-print march-rainfall
      file-write "april ,"
      file-print april-rainfall
      file-write "may ,"
      file-print may-rainfall
      file-write "june ,"
      file-print june-rainfall
      file-write "july ,"
      file-print july-rainfall
      file-write "august ,"
      file-print august-rainfall
      file-write "september ,"
      file-print september-rainfall
      file-write "october ,"
      file-print october-rainfall
      file-write "november ,"
      file-print november-rainfall
      file-write "december ,"
      file-print december-rainfall
      file-close

end


to set-previous-percipitation

      ifelse month = 1 [
     set previous-percipitation december-rainfall

    ][
      ifelse month = 2 [
      set previous-percipitation january-rainfall

      ][
      ifelse month = 3 [

      set previous-percipitation february-rainfall

      ][
      ifelse month = 4 [

      set previous-percipitation march-rainfall

      ][
      ifelse month = 5 [
      set previous-percipitation april-rainfall

      ][
      ifelse month = 6 [

      set previous-percipitation may-rainfall

      ][
      ifelse month = 7 [
      set previous-percipitation june-rainfall

      ][
      ifelse month = 8 [

       set previous-percipitation july-rainfall

      ][
      ifelse month = 9 [

      set previous-percipitation august-rainfall

      ][
      ifelse month = 10 [

      set previous-percipitation september-rainfall

      ][
      ifelse month = 11 [

      set previous-percipitation october-rainfall

      ][
      ifelse month = 12 [

       set previous-percipitation november-rainfall


      ][
    ]]]]]]]]]]]]
end


to update-snake-density

  ifelse month = 1 [
    set monthly-activity-factor  (( january-rainfall / 1000) ^ .5)

  ][
  ifelse month = 2 [
    set monthly-activity-factor   (( february-rainfall / 1000) ^ .5)

   ][
   ifelse month = 3 [
     set monthly-activity-factor  (( march-rainfall / 1000) ^ .5)

   ][
   ifelse month = 4 [
     set monthly-activity-factor  (( april-rainfall / 1000) ^ .5)

   ][
   ifelse month = 5 [
     set monthly-activity-factor (( may-rainfall / 1000) ^ .5)

   ][
   ifelse month = 6 [
     set monthly-activity-factor  (( june-rainfall / 1000) ^ .5)

   ][
   ifelse month = 7 [
     set monthly-activity-factor  (( july-rainfall / 1000) ^ .5)

   ][
   ifelse month = 8 [
     set monthly-activity-factor  (( august-rainfall / 1000) ^ .5)

   ][
   ifelse month = 9 [
     set monthly-activity-factor  (( september-rainfall / 1000) ^ .5)

   ][
   ifelse month = 10 [
     set monthly-activity-factor (( october-rainfall / 1000) ^ .5)

   ][
   ifelse month = 11 [
     set monthly-activity-factor  (( november-rainfall / 1000) ^ .5)

   ][
   ifelse month = 12 [
     set monthly-activity-factor (( december-rainfall / 1000) ^ .5)

   ][
  ]]]]]]]]]]]]

end


to snake-seasonal-activity

  set snakes-set turtle-set snakes
  let snakes-list sort snakes-set

  foreach snakes-list [ x ->

    ask x [
      let dice random-float 1
      ifelse (dice < monthly-activity-factor) [
        set seasonal-active? TRUE
      ][
      ifelse (dice > monthly-activity-factor) [
        set seasonal-active? FALSE
        ][
      ]]

    ]

  ]

end



to moving-matrix

    ; 0 - forest    1 - rubber    2 - rice    3 - home\orchid    4 - tea

  set snakes-set turtle-set snakes
  let snakes-list sort snakes-set

  let forest-patches count forest-patch
  let rubber-patches count rubber-patch
  let rice-patches count rice-patch
  let home-patches count home-patch
  let tea-patches count tea-patch

  foreach snakes-list [x ->

    let dice random-float 1

   ask x [

    ifelse name = "cobra" [
      ifelse (dice < (dif-forest-cobra)) and (forest-patches > 0)  [

          move-to one-of forest-patch
          set where-i-am "forest"

      ][
      ifelse (dice > (dif-forest-cobra) ) and (dice < (dif-forest-cobra + dif-rubber-cobra) ) and  (rubber-patches > 0) [

           move-to one-of rubber-patch
           set where-i-am "rubber"

      ][
      ifelse (dice > (dif-forest-cobra + dif-rubber-cobra)) and (dice < (dif-forest-cobra + dif-rubber-cobra + dif-rice-cobra) ) and (rice-patches > 0) [

           move-to one-of rice-patch
           set where-i-am "rice"
      ][
      ifelse (dice > (dif-forest-cobra + dif-rubber-cobra + dif-rice-cobra)) and (dice < (dif-forest-cobra + dif-rubber-cobra + dif-rice-cobra + dif-home-cobra)) and (home-patches > 0) [

           move-to one-of home-patch
           set where-i-am "home"
      ][
      ifelse (dice > (dif-forest-cobra + dif-rubber-cobra + dif-rice-cobra + dif-home-cobra)) and (dice < (dif-forest-cobra + dif-rubber-cobra + dif-rice-cobra + dif-home-cobra + dif-tea-cobra)) and (tea-patches > 0) [

            move-to one-of tea-patch
            set where-i-am "tea"
       ][
      ]]]]]




    ][
    ifelse name = "russels-viper" [
      ifelse (dice < (dif-forest-russels-viper)) and (forest-patches > 0)  [

          move-to one-of forest-patch
          set where-i-am "forest"
      ][
      ifelse (dice > (dif-forest-russels-viper) ) and (dice < (dif-forest-russels-viper + dif-rubber-russels-viper) ) and  (rubber-patches > 0) [

           move-to one-of rubber-patch
           set where-i-am "rubber"
      ][
      ifelse (dice > (dif-forest-russels-viper + dif-rubber-russels-viper)) and (dice < (dif-forest-russels-viper + dif-rubber-russels-viper + dif-rice-russels-viper) ) and (rice-patches > 0) [

           move-to one-of rice-patch
           set where-i-am "rice"
      ][
      ifelse (dice > (dif-forest-russels-viper + dif-rubber-russels-viper + dif-rice-russels-viper)) and (dice < (dif-forest-russels-viper + dif-rubber-russels-viper + dif-rice-russels-viper + dif-home-russels-viper)) and (home-patches > 0) [

           move-to one-of home-patch
           set where-i-am "home"
      ][
      ifelse (dice > (dif-forest-russels-viper + dif-rubber-russels-viper + dif-rice-russels-viper + dif-home-russels-viper)) and (dice < (dif-forest-russels-viper + dif-rubber-russels-viper + dif-rice-russels-viper + dif-home-russels-viper + dif-tea-russels-viper)) and (tea-patches > 0) [

            move-to one-of tea-patch
            set where-i-am "tea"
       ][
      ]]]]]




    ][
    ifelse name = "saw-scaled-viper" [
      ifelse (dice < (dif-forest-saw-scaled-viper)) and (forest-patches > 0)  [

          move-to one-of forest-patch
          set where-i-am "forest"
      ][
      ifelse (dice > (dif-forest-saw-scaled-viper) ) and (dice < (dif-forest-saw-scaled-viper + dif-rubber-saw-scaled-viper) ) and  (rubber-patches > 0) [

           move-to one-of rubber-patch
           set where-i-am "rubber"
      ][
      ifelse (dice > (dif-forest-saw-scaled-viper + dif-rubber-saw-scaled-viper)) and (dice < (dif-forest-saw-scaled-viper + dif-rubber-saw-scaled-viper + dif-rice-saw-scaled-viper) ) and (rice-patches > 0) [

           move-to one-of rice-patch
           set where-i-am "rice"
      ][
      ifelse (dice > (dif-forest-saw-scaled-viper + dif-rubber-saw-scaled-viper + dif-rice-saw-scaled-viper)) and (dice < (dif-forest-saw-scaled-viper + dif-rubber-saw-scaled-viper + dif-rice-saw-scaled-viper + dif-home-saw-scaled-viper)) and (home-patches > 0) [

           move-to one-of home-patch
           set where-i-am "home"
      ][
      ifelse (dice > (dif-forest-saw-scaled-viper + dif-rubber-saw-scaled-viper + dif-rice-saw-scaled-viper + dif-home-saw-scaled-viper)) and (dice < (dif-forest-saw-scaled-viper + dif-rubber-saw-scaled-viper + dif-rice-saw-scaled-viper + dif-home-saw-scaled-viper + dif-tea-saw-scaled-viper)) and (tea-patches > 0) [

            move-to one-of tea-patch
            set where-i-am "tea"
       ][
      ]]]]]




    ][
    ifelse name = "tree-viper" [
      ifelse (dice < (dif-forest-tree-viper)) and (forest-patches > 0)  [

          move-to one-of forest-patch
          set where-i-am "forest"
      ][
      ifelse (dice > (dif-forest-tree-viper) ) and (dice < (dif-forest-tree-viper + dif-rubber-tree-viper) ) and  (rubber-patches > 0) [

           move-to one-of rubber-patch
           set where-i-am "rubber"
      ][
      ifelse (dice > (dif-forest-tree-viper + dif-rubber-tree-viper)) and (dice < (dif-forest-tree-viper + dif-rubber-tree-viper + dif-rice-tree-viper) ) and (rice-patches > 0) [

           move-to one-of rice-patch
           set where-i-am "rice"
      ][
      ifelse (dice > (dif-forest-tree-viper + dif-rubber-tree-viper + dif-rice-tree-viper)) and (dice < (dif-forest-tree-viper + dif-rubber-tree-viper + dif-rice-tree-viper + dif-home-tree-viper)) and (home-patches > 0) [

           move-to one-of home-patch
           set where-i-am "home"
      ][
      ifelse (dice > (dif-forest-tree-viper + dif-rubber-tree-viper + dif-rice-tree-viper + dif-home-tree-viper)) and (dice < (dif-forest-tree-viper + dif-rubber-tree-viper + dif-rice-tree-viper + dif-home-tree-viper + dif-tea-tree-viper)) and (tea-patches > 0) [

            move-to one-of tea-patch
            set where-i-am "tea"
       ][
      ]]]]]




    ][
    ifelse name = "common-krait" [
      ifelse (dice < (dif-forest-common-krait)) and (forest-patches > 0)  [

          move-to one-of forest-patch
          set where-i-am "forest"
      ][
      ifelse (dice > (dif-forest-common-krait) ) and (dice < (dif-forest-common-krait + dif-rubber-common-krait) ) and  (rubber-patches > 0) [

           move-to one-of rubber-patch
           set where-i-am "rubber"
      ][
      ifelse (dice > (dif-forest-common-krait + dif-rubber-common-krait)) and (dice < (dif-forest-common-krait + dif-rubber-common-krait + dif-rice-common-krait) ) and (rice-patches > 0) [

           move-to one-of rice-patch
           set where-i-am "rice"
      ][
      ifelse (dice > (dif-forest-common-krait + dif-rubber-common-krait + dif-rice-common-krait)) and (dice < (dif-forest-common-krait + dif-rubber-common-krait + dif-rice-common-krait + dif-home-common-krait)) and (home-patches > 0) [

           move-to one-of home-patch
           set where-i-am "home"
      ][
      ifelse (dice > (dif-forest-common-krait + dif-rubber-common-krait + dif-rice-common-krait + dif-home-common-krait)) and (dice < (dif-forest-common-krait + dif-rubber-common-krait + dif-rice-common-krait + dif-home-common-krait + dif-tea-common-krait)) and (tea-patches > 0) [

            move-to one-of tea-patch
            set where-i-am "tea"
       ][
      ]]]]]




    ][
    ifelse name = "ceylon-krait" [
      ifelse (dice < (dif-forest-ceylon-krait)) and (forest-patches > 0)  [

          move-to one-of forest-patch
          set where-i-am "forest"
      ][
      ifelse (dice > (dif-forest-ceylon-krait) ) and (dice < (dif-forest-ceylon-krait + dif-rubber-ceylon-krait) ) and  (rubber-patches > 0) [

           move-to one-of rubber-patch
           set where-i-am "rubber"
      ][
      ifelse (dice > (dif-forest-ceylon-krait + dif-rubber-ceylon-krait)) and (dice < (dif-forest-ceylon-krait + dif-rubber-ceylon-krait + dif-rice-ceylon-krait) ) and (rice-patches > 0) [

           move-to one-of rice-patch
           set where-i-am "rice"
      ][
      ifelse (dice > (dif-forest-ceylon-krait + dif-rubber-ceylon-krait + dif-rice-ceylon-krait)) and (dice < (dif-forest-ceylon-krait + dif-rubber-ceylon-krait + dif-rice-ceylon-krait + dif-home-ceylon-krait)) and (home-patches > 0) [

           move-to one-of home-patch
           set where-i-am "home"
      ][
      ifelse (dice > (dif-forest-ceylon-krait + dif-rubber-ceylon-krait + dif-rice-ceylon-krait + dif-home-ceylon-krait)) and (dice < (dif-forest-ceylon-krait + dif-rubber-ceylon-krait + dif-rice-ceylon-krait + dif-home-ceylon-krait + dif-tea-ceylon-krait)) and (tea-patches > 0) [

            move-to one-of tea-patch
            set where-i-am "tea"
       ][
      ]]]]]




    ][
    ifelse name = "hump-nosed-viper" [
      ifelse (dice < (dif-forest-hump-nosed-viper)) and (forest-patches > 0)  [

          move-to one-of forest-patch
          set where-i-am "forest"
      ][
      ifelse (dice > (dif-forest-hump-nosed-viper) ) and (dice < (dif-forest-hump-nosed-viper + dif-rubber-hump-nosed-viper) ) and  (rubber-patches > 0) [

           move-to one-of rubber-patch
           set where-i-am "rubber"
      ][
      ifelse (dice > (dif-forest-hump-nosed-viper + dif-rubber-hump-nosed-viper)) and (dice < (dif-forest-hump-nosed-viper + dif-rubber-hump-nosed-viper + dif-rice-hump-nosed-viper) ) and (rice-patches > 0) [

           move-to one-of rice-patch
           set where-i-am "rice"
      ][
      ifelse (dice > (dif-forest-hump-nosed-viper + dif-rubber-hump-nosed-viper + dif-rice-hump-nosed-viper)) and (dice < (dif-forest-hump-nosed-viper + dif-rubber-hump-nosed-viper + dif-rice-hump-nosed-viper + dif-home-hump-nosed-viper)) and (home-patches > 0) [

           move-to one-of home-patch
           set where-i-am "home"
      ][
      ifelse (dice > (dif-forest-hump-nosed-viper + dif-rubber-hump-nosed-viper + dif-rice-hump-nosed-viper + dif-home-hump-nosed-viper)) and (dice < (dif-forest-hump-nosed-viper + dif-rubber-hump-nosed-viper + dif-rice-hump-nosed-viper + dif-home-hump-nosed-viper + dif-tea-hump-nosed-viper)) and (tea-patches > 0) [

            move-to one-of tea-patch
            set where-i-am "tea"
       ][
      ]]]]]




    ][
    ]]]]]]]
    ]

  ]





end



to setup-matrix
  ; 0 - forest    1 - rubber    2 - rice    3 - home\orchid    4 - tea


  let forest-patches count forest-patch
  let rubber-patches count rubber-patch
  let rice-patches count rice-patch
  let home-patches count home-patch
  let tea-patches count tea-patch

  let number-of-patches 0

  ifelse map-type =  "my-map" [
    set number-of-patches 18496
  ][
  ifelse map-type = "joes-map" [
   set number-of-patches 18496
  ][
  ifelse map-type = "sentinal" [
   set number-of-patches 160000
  ][
  ]]]



  foreach SNAKE-NAMES [ x ->

    ifelse x = "cobra" [

      if forest-patches > 0 [
      set forest-cobra (((item 0 cobra-habitat-condition) * (forest-patches)) / number-of-patches)
      ]
      if rubber-patches > 0 [
      set rubber-cobra (((item 1 cobra-habitat-condition) * (rubber-patches)) / number-of-patches)
      ]
      if rice-patches > 0 [
      set rice-cobra (((item 2 cobra-habitat-condition) * (rice-patches) / number-of-patches))
      ]
      if home-patches > 0 [
      set home-cobra (((item 3 cobra-habitat-condition) * (home-patches)) / number-of-patches)
      ]
      if tea-patches > 0 [
      set tea-cobra (((item 4 cobra-habitat-condition) * (tea-patches)) / number-of-patches)
      ]



      set dif-forest-cobra ( forest-cobra / (forest-cobra + rubber-cobra + rice-cobra + home-cobra + tea-cobra))
      set dif-rubber-cobra ( rubber-cobra / (forest-cobra + rubber-cobra + rice-cobra + home-cobra + tea-cobra))
      set dif-rice-cobra ( rice-cobra / (forest-cobra + rubber-cobra + rice-cobra + home-cobra + tea-cobra))
      set dif-home-cobra ( home-cobra / (forest-cobra + rubber-cobra + rice-cobra + home-cobra + tea-cobra))
      set dif-tea-cobra ( tea-cobra / (forest-cobra + rubber-cobra + rice-cobra + home-cobra + tea-cobra))


    ][
    ifelse x = "russels-viper" [


       if forest-patches > 0 [
      set forest-russels-viper (((item 0 russels-viper-habitat-condition) * (forest-patches)) / number-of-patches)
      ]
      if rubber-patches > 0 [
      set rubber-russels-viper (((item 1 russels-viper-habitat-condition) * (rubber-patches)) / number-of-patches)
      ]
      if rice-patches > 0 [
      set rice-russels-viper (((item 2 russels-viper-habitat-condition) * (rice-patches) / number-of-patches))
      ]
      if home-patches > 0 [
      set home-russels-viper (((item 3 russels-viper-habitat-condition) * (home-patches)) / number-of-patches)
      ]
      if tea-patches > 0 [
      set tea-russels-viper (((item 4 russels-viper-habitat-condition) * (tea-patches)) / number-of-patches)
      ]



      set dif-forest-russels-viper ( forest-russels-viper / (forest-russels-viper + rubber-russels-viper + rice-russels-viper + home-russels-viper + tea-russels-viper))
      set dif-rubber-russels-viper ( rubber-russels-viper / (forest-russels-viper + rubber-russels-viper + rice-russels-viper + home-russels-viper + tea-russels-viper))
      set dif-rice-russels-viper ( rice-russels-viper / (forest-russels-viper + rubber-russels-viper + rice-russels-viper + home-russels-viper + tea-russels-viper))
      set dif-home-russels-viper ( home-russels-viper / (forest-russels-viper + rubber-russels-viper + rice-russels-viper + home-russels-viper + tea-russels-viper))
      set dif-tea-russels-viper ( tea-russels-viper / (forest-russels-viper + rubber-russels-viper + rice-russels-viper + home-russels-viper + tea-russels-viper))

    ][
    ifelse x = "saw-scaled-viper" [


       if forest-patches > 0 [
      set forest-saw-scaled-viper (((item 0 saw-scaled-viper-habitat-condition) * (forest-patches)) / number-of-patches)
      ]
      if rubber-patches > 0 [
      set rubber-saw-scaled-viper (((item 1 saw-scaled-viper-habitat-condition) * (rubber-patches)) / number-of-patches)
      ]
      if rice-patches > 0 [
      set rice-saw-scaled-viper (((item 2 saw-scaled-viper-habitat-condition) * (rice-patches) / number-of-patches))
      ]
      if home-patches > 0 [
      set home-saw-scaled-viper (((item 3 saw-scaled-viper-habitat-condition) * (home-patches)) / number-of-patches)
      ]
      if tea-patches > 0 [
      set tea-saw-scaled-viper (((item 4 saw-scaled-viper-habitat-condition) * (tea-patches)) / number-of-patches)
      ]



      set dif-forest-saw-scaled-viper ( forest-saw-scaled-viper / (forest-saw-scaled-viper + rubber-saw-scaled-viper + rice-saw-scaled-viper + home-saw-scaled-viper + tea-saw-scaled-viper))
      set dif-rubber-saw-scaled-viper ( rubber-saw-scaled-viper / (forest-saw-scaled-viper + rubber-saw-scaled-viper + rice-saw-scaled-viper + home-saw-scaled-viper + tea-saw-scaled-viper))
      set dif-rice-saw-scaled-viper ( rice-saw-scaled-viper / (forest-saw-scaled-viper + rubber-saw-scaled-viper + rice-saw-scaled-viper + home-saw-scaled-viper + tea-saw-scaled-viper))
      set dif-home-saw-scaled-viper ( home-saw-scaled-viper / (forest-saw-scaled-viper + rubber-saw-scaled-viper + rice-saw-scaled-viper + home-saw-scaled-viper + tea-saw-scaled-viper))
      set dif-tea-saw-scaled-viper ( tea-saw-scaled-viper / (forest-saw-scaled-viper + rubber-saw-scaled-viper + rice-saw-scaled-viper + home-saw-scaled-viper + tea-saw-scaled-viper))

    ][
    ifelse x = "tree-viper" [

    if forest-patches > 0 [
      set forest-tree-viper (((item 0 tree-viper-habitat-condition) * (forest-patches)) / number-of-patches)
      ]
      if rubber-patches > 0 [
      set rubber-tree-viper (((item 1 tree-viper-habitat-condition) * (rubber-patches)) / number-of-patches)
      ]
      if rice-patches > 0 [
      set rice-tree-viper (((item 2 tree-viper-habitat-condition) * (rice-patches) / number-of-patches))
      ]
      if home-patches > 0 [
      set home-tree-viper (((item 3 tree-viper-habitat-condition) * (home-patches)) / number-of-patches)
      ]
      if tea-patches > 0 [
      set tea-tree-viper (((item 4 tree-viper-habitat-condition) * (tea-patches)) / number-of-patches)
      ]



      set dif-forest-tree-viper ( forest-tree-viper / (forest-tree-viper + rubber-tree-viper + rice-tree-viper + home-tree-viper + tea-tree-viper))
      set dif-rubber-tree-viper ( rubber-tree-viper / (forest-tree-viper + rubber-tree-viper + rice-tree-viper + home-tree-viper + tea-tree-viper))
      set dif-rice-tree-viper ( rice-tree-viper / (forest-tree-viper + rubber-tree-viper + rice-tree-viper + home-tree-viper + tea-tree-viper))
      set dif-home-tree-viper ( home-tree-viper / (forest-tree-viper + rubber-tree-viper + rice-tree-viper + home-tree-viper + tea-tree-viper))
      set dif-tea-tree-viper ( tea-tree-viper / (forest-tree-viper + rubber-tree-viper + rice-tree-viper + home-tree-viper + tea-tree-viper))


    ][
    ifelse x = "common-krait" [

    if forest-patches > 0 [
      set forest-common-krait (((item 0 common-krait-habitat-condition) * (forest-patches)) / number-of-patches)
      ]
      if rubber-patches > 0 [
      set rubber-common-krait (((item 1 common-krait-habitat-condition) * (rubber-patches)) / number-of-patches)
      ]
      if rice-patches > 0 [
      set rice-common-krait (((item 2 common-krait-habitat-condition) * (rice-patches) / number-of-patches))
      ]
      if home-patches > 0 [
      set home-common-krait (((item 3 common-krait-habitat-condition) * (home-patches)) / number-of-patches)
      ]
      if tea-patches > 0 [
      set tea-common-krait (((item 4 common-krait-habitat-condition) * (tea-patches)) / number-of-patches)
      ]



      set dif-forest-common-krait ( forest-common-krait / (forest-common-krait + rubber-common-krait + rice-common-krait + home-common-krait + tea-common-krait))
      set dif-rubber-common-krait ( rubber-common-krait / (forest-common-krait + rubber-common-krait + rice-common-krait + home-common-krait + tea-common-krait))
      set dif-rice-common-krait ( rice-common-krait / (forest-common-krait + rubber-common-krait + rice-common-krait + home-common-krait + tea-common-krait))
      set dif-home-common-krait ( home-common-krait / (forest-common-krait + rubber-common-krait + rice-common-krait + home-common-krait + tea-common-krait))
      set dif-tea-common-krait ( tea-common-krait / (forest-common-krait + rubber-common-krait + rice-common-krait + home-common-krait + tea-common-krait))


    ][
    ifelse x = "ceylon-krait" [

     if forest-patches > 0 [
      set forest-ceylon-krait (((item 0 ceylon-krait-habitat-condition) * (forest-patches)) / number-of-patches)
      ]
      if rubber-patches > 0 [
      set rubber-ceylon-krait (((item 1 ceylon-krait-habitat-condition) * (rubber-patches)) / number-of-patches)
      ]
      if rice-patches > 0 [
      set rice-ceylon-krait (((item 2 ceylon-krait-habitat-condition) * (rice-patches) / number-of-patches))
      ]
      if home-patches > 0 [
      set home-ceylon-krait (((item 3 ceylon-krait-habitat-condition) * (home-patches)) / number-of-patches)
      ]
      if tea-patches > 0 [
      set tea-ceylon-krait (((item 4 ceylon-krait-habitat-condition) * (tea-patches)) / number-of-patches)
      ]



      set dif-forest-ceylon-krait ( forest-ceylon-krait / (forest-ceylon-krait + rubber-ceylon-krait + rice-ceylon-krait + home-ceylon-krait + tea-ceylon-krait))
      set dif-rubber-ceylon-krait ( rubber-ceylon-krait / (forest-ceylon-krait + rubber-ceylon-krait + rice-ceylon-krait + home-ceylon-krait + tea-ceylon-krait))
      set dif-rice-ceylon-krait ( rice-ceylon-krait / (forest-ceylon-krait + rubber-ceylon-krait + rice-ceylon-krait + home-ceylon-krait + tea-ceylon-krait))
      set dif-home-ceylon-krait ( home-ceylon-krait / (forest-ceylon-krait + rubber-ceylon-krait + rice-ceylon-krait + home-ceylon-krait + tea-ceylon-krait))
      set dif-tea-ceylon-krait ( tea-ceylon-krait / (forest-ceylon-krait + rubber-ceylon-krait + rice-ceylon-krait + home-ceylon-krait + tea-ceylon-krait))

    ][
    ifelse x = "hump-nosed-viper" [

    if forest-patches > 0 [
      set forest-hump-nosed-viper (((item 0 hump-nosed-viper-habitat-condition) * (forest-patches)) / number-of-patches)
      ]
      if rubber-patches > 0 [
      set rubber-hump-nosed-viper (((item 1 hump-nosed-viper-habitat-condition) * (rubber-patches)) / number-of-patches)
      ]
      if rice-patches > 0 [
      set rice-hump-nosed-viper (((item 2 hump-nosed-viper-habitat-condition) * (rice-patches) / number-of-patches))
      ]
      if home-patches > 0 [
      set home-hump-nosed-viper (((item 3 hump-nosed-viper-habitat-condition) * (home-patches)) / number-of-patches)
      ]
      if tea-patches > 0 [
      set tea-hump-nosed-viper (((item 4 hump-nosed-viper-habitat-condition) * (tea-patches)) / number-of-patches)
      ]



      set dif-forest-hump-nosed-viper ( forest-hump-nosed-viper / (forest-hump-nosed-viper + rubber-hump-nosed-viper + rice-hump-nosed-viper + home-hump-nosed-viper + tea-hump-nosed-viper))
      set dif-rubber-hump-nosed-viper ( rubber-hump-nosed-viper / (forest-hump-nosed-viper + rubber-hump-nosed-viper + rice-hump-nosed-viper + home-hump-nosed-viper + tea-hump-nosed-viper))
      set dif-rice-hump-nosed-viper ( rice-hump-nosed-viper / (forest-hump-nosed-viper + rubber-hump-nosed-viper + rice-hump-nosed-viper + home-hump-nosed-viper + tea-hump-nosed-viper))
      set dif-home-hump-nosed-viper ( home-hump-nosed-viper / (forest-hump-nosed-viper + rubber-hump-nosed-viper + rice-hump-nosed-viper + home-hump-nosed-viper + tea-hump-nosed-viper))
      set dif-tea-hump-nosed-viper ( tea-hump-nosed-viper / (forest-hump-nosed-viper + rubber-hump-nosed-viper + rice-hump-nosed-viper + home-hump-nosed-viper + tea-hump-nosed-viper))


    ][
    ]]]]]]]
  ]
end


to give-birth

  set birth-rate 0
  set snakes-set turtle-set snakes
  let snakes-list sort snakes-set

  foreach snakes-list [x ->

    ask x [

    let dice random-float 1
    let this-name [name] of x

    if month = 1 [
      if dice > ( 1 - birth-rate) [

          hatch 1
          [set name this-name]
        ]
      ]
    ]
  ]

end


to kill
   set killing-probability 0

   let human-range 0

 ask farmers [
    ifelse ([land-type] of patch-here = "rice") [
      set human-range rice-ha
      if any? snakes-on patches in-radius human-range  [
        let attacker one-of snakes-on patches in-radius human-range
        ;let attacker-name attacker name
        let dice random 100


        if ([active?] of attacker = TRUE) and (dice < killing-probability)  [

            show attacker
            ask attacker [
            die]]

      ]
    ][
     ifelse ([land-type] of patch-here = "tea") [
      set human-range tea-ha
        if any? snakes-on patches in-radius human-range [

          let attacker one-of snakes-on patches in-radius human-range
        ;let attacker-name attacker name

        let dice random 100


        if ([active?] of attacker = TRUE) and (dice < killing-probability)  [

            show attacker
            ask attacker [
            die]]

        ]
    ][
     ifelse ([land-type] of patch-here = "rubber") [
      set human-range rubber-ha
          if any? snakes-on patches in-radius human-range [

            let attacker one-of snakes-on patches in-radius human-range
        ;let attacker-name attacker name

        let dice random 100


        if ([active?] of attacker = TRUE) and (dice < killing-probability)  [
              show attacker
            ask attacker [

            die]]

      ]
    ][
     ifelse ([land-type] of patch-here = "orchid") [
      set human-range orchid-ha
           if any? snakes-on patches in-radius human-range [

           let attacker one-of snakes-on patches in-radius human-range

           let dice random 100


        if ([active?] of attacker = TRUE) and (dice < killing-probability)  [

            show attacker
            ask attacker [
            die]]


            ]
    ][
      ifelse ([land-type] of patch-here = "home") [

              set human-range home-ha
           if any? snakes-on patches in-radius human-range [

           let attacker one-of snakes-on patches in-radius human-range

           let dice random 100


        if ([active?] of attacker = TRUE) and (dice < killing-probability)  [

            show attacker
            ask attacker [
            die]]

       ;if any? snakes-on
              ]
    ][
      ifelse ([land-type] of patch-here = "forest") [

                  set human-range forest-ha
           if any? snakes-on patches in-radius human-range [

           let attacker one-of snakes-on patches in-radius human-range

           let dice random 100


        if ([active?] of attacker = TRUE) and (dice < killing-probability)  [

            show attacker
            ask attacker [
            die]]
                ]
    ][
    ]]]]]]]
;
 ;  let victim one-of farmers with [disatnce <
 ; if prey != nobody  [
 ;   ask prey [ die ]
 ;   set energy energy + wolf-gain-from-food
 ; ]]

end

;to update-human-population
;  if (population-increase = TRUE)[
;    set human-pop-density human-pop-density * 1.1
;    ;;print human-pop-density
;  ]
;end


;to transition-matrix

  ;(((people per 1km*1km \ 30) * (number of patches of lc type \ 10,000)) \ (number of farmers with specific land type))

  ;at begining of the day ask farmers to choose schedule

;  let agri-types ["rice" "tea" "rubber"]
;  let rice-index [0 300 300 300 300 300 300 300 300 300 300 300 300]
;  let tea-index [0 200 200 200 200 200 200 200 200 200 200 200 200]
;  let rubber-index [0 10 10 10 10 10 10 10 10 10 10 10 10]
;  ask farmers [
;    set moved? FALSE]
;  let tea-factor 1



 ; foreach agri-types [ x ->

;    let p-field 0
;    let p-home 0
;    let random-draw 0

;    let size-for-calc count patches with [land-type = x]
;    let farmers-for-calc 0

;    ifelse work-division-model = TRUE [
;    set farmers-for-calc count farmers with [(farmer-type = x) and (working? = TRUE)]
;    ]
;    [
;    set farmers-for-calc count farmers with [farmer-type = x]
;    ]


;    ifelse x = "rice" [



;    set p-field (((item month rice-index / 30 ) * ( size-for-calc / 10000)) / ( farmers-for-calc))
;    set p-home (1 - p-field)

;    repeat farmers-for-calc [


;    set random-draw random-float 1

;    ifelse work-division-model = TRUE [

;    ifelse random-draw > p-field [
;        ask one-of farmers with [(farmer-type = "rice") and (moved? = FALSE) and (working? = TRUE)][
;          move-to one-of houses with [household-number = [house-number] of myself]
;          set moved? TRUE
;        ]
;      ][
;     ifelse random-draw < p-field [
;        ask one-of farmers with [(farmer-type = "rice") and (moved? = FALSE) and (working? = TRUE)][
;          move-to one-of patches with [land-type = "rice"]
;          set moved? TRUE
;        ]
;      ][
;      ]]

;        ]
;        [

;              ifelse random-draw > p-field [
;        ask one-of farmers with [(farmer-type = "rice") and (moved? = FALSE)][
;          move-to one-of houses with [household-number = [house-number] of myself]
;          set moved? TRUE
;        ]
;      ][
;     ifelse random-draw < p-field [
;        ask one-of farmers with [(farmer-type = "rice") and (moved? = FALSE)][
;          move-to one-of patches with [land-type = "rice"]
;          set moved? TRUE
;        ]
;      ][
;      ]]

;        ]

;      ]

;  ][

;    ifelse x = "tea" [

;    ifelse month <= 6 [

;          set tea-factor (((previous-percipitation / 500) * .25) + .7)

;        ][


;    ifelse month < 6 [

;          set tea-factor (((previous-percipitation / 500) * .25) + .75)

;        ][

;    ]]






;    set p-field ((((item month tea-index * tea-factor )/ 30 ) * ( size-for-calc / 10000)) / ( farmers-for-calc))

;     show p-field
;     repeat farmers-for-calc [

;    set random-draw random-float 1

;    ifelse work-division-model = TRUE [

;    ifelse random-draw > p-field [
;        ask one-of farmers with [(farmer-type = "tea") and (moved? = FALSE) and (working? = TRUE)][
;          move-to one-of houses with [household-number = [house-number] of myself]
;          set moved? TRUE
;        ]
;      ][
;     ifelse random-draw < p-field [
;        ask one-of farmers with [(farmer-type = "tea") and (moved? = FALSE) and (working? = TRUE)][
;          move-to one-of patches with [land-type = "tea"]
;          set moved? TRUE
;        ]
;      ][
;      ]]

;          ]
;          [
;                ifelse random-draw > p-field [
;        ask one-of farmers with [(farmer-type = "tea") and (moved? = FALSE)][
;          move-to one-of houses with [household-number = [house-number] of myself]
;          set moved? TRUE
;        ]
;      ][
;     ifelse random-draw < p-field [
;        ask one-of farmers with [(farmer-type = "tea") and (moved? = FALSE)][
;          move-to one-of patches with [land-type = "tea"]
;          set moved? TRUE
;        ]
;      ][
;      ]]
;          ]



;      ]

;  ][

;    ifelse x = "rubber" [

;    set p-field (((item month rubber-index / 30 ) * ( size-for-calc / 10000)) / ( farmers-for-calc))

;     show p-field
;     repeat farmers-for-calc [

;    set random-draw random-float 1

;    ifelse work-division-model = TRUE [

;    ifelse random-draw > p-field [
;        ask one-of farmers with [(farmer-type = "rubber") and (moved? = FALSE) and (working? = TRUE)][
;          move-to one-of houses with [household-number = [house-number] of myself]
;          set moved? TRUE
;        ]
;      ][
;     ifelse random-draw < p-field [
;        ask one-of farmers with [(farmer-type = "rubber") and (moved? = FALSE) and (working? = TRUE)][
;          move-to one-of patches with [land-type = "rubber"]
;          set moved? TRUE
;        ]
;      ][
;      ]]
;            ]
;            [
;              ifelse random-draw > p-field [
;        ask one-of farmers with [(farmer-type = "rubber") and (moved? = FALSE)][
;          move-to one-of houses with [household-number = [house-number] of myself]
;          set moved? TRUE
;        ]
;      ][
;     ifelse random-draw < p-field [
;        ask one-of farmers with [(farmer-type = "rubber") and (moved? = FALSE)][
;          move-to one-of patches with [land-type = "rubber"]
;          set moved? TRUE
;        ]
;      ][
;      ]]
;            ]

;      ]

;  ][
;  ]]]
;      ]



;end



to creat-work-scheudle

  ;calculate index for each month in insert monthly index to each calculation
  ;calculate time start
  ;calculaute time total

  ask farmers[
    set selected? false]

  ;working vector for rice is the reported working index (one for planting and one for harvest rn taken from farmer 22) devided by the probability of workins working on that month
  let rice-vector [0 12.16 72.96 99.39 84.5 33.8 16.9 52.2 110.06 50.28 13.26 79.68 38.72]
  ;planting vs harvesting if 1 its a planting month if 2 its a harvesting month 3 is both
  let rice-vector-2 [0 2 2 3 1 1 1 2 3 3 1 1 3]


  ;working vector for tea according to farmer 18
  let tea-vector [0 80.8 80.8 80.8 80.8 80.8 80.8 80.8 80.8 80.8 80.8 80.8 80.8]
  ;number of rainy days according to domoros et al 1993
  ; [ 0 11 10 17 22 23 25 23 21 21 23 24 20] days worked is calculated using 1 - potential rainy days
  let rubber-vector [0 102.6 0 70.2 43.2 37.8 27 37.8 48.6 48.6 37.8 43.2 54]



  let size-for-calc-rice count rice-patch
  let number-of-rice-farmers-need (item month rice-vector) * ( size-for-calc-rice / 10000)
  show number-of-rice-farmers-need

  let size-for-calc-tea count tea-patch
  let number-of-tea-farmers-need (item month tea-vector) * ( size-for-calc-tea / 10000)
  show number-of-tea-farmers-need

  let size-for-calc-rubber count rubber-patch
  let number-of-rubber-farmers-need (item month rubber-vector) * ( size-for-calc-rubber / 10000)
  show number-of-rubber-farmers-need

    let item-x 1
  let max-list [0]

  while [item-x < 13 ] [
   let value  (item item-x rice-vector) * ( size-for-calc-rice / 10000) + (item item-x tea-vector) * ( size-for-calc-rice / 10000) + (item item-x rubber-vector) * ( size-for-calc-rice / 10000)
   set max-list lput value max-list
   set item-x item-x + 1
  ]
  show max-list
  let normalizer max max-list


  let normalized-rice (number-of-rice-farmers-need / (normalizer) * human-pop-density)
  show normalized-rice
  let normalized-tea (number-of-tea-farmers-need / (normalizer) * human-pop-density)
  show normalized-tea
  let normalized-rubber (number-of-rubber-farmers-need / (normalizer) * human-pop-density)
  show normalized-rubber

  let number-of-farmer ""



  while [(round (normalized-rice) > 0) and (count farmers with [selected? = false]) > 0] [
    ask one-of farmers with [selected? = false][

      ifelse item month rice-vector-2 = 1 [
      set starting-hour round (random-normal 7.15 0.45)
      let schedule-of-this-farmer (9 + random 6)
      set schedule schedule-of-this-farmer

      ][
      ifelse item month rice-vector-2 = 2 [
      set starting-hour round (random-normal 7.15 1.292105)
      let schedule-of-this-farmer (9 + random 10)
      set schedule schedule-of-this-farmer

      ][
      ifelse item month rice-vector-2 = 3 [
      set starting-hour round (random-normal 7.15 0.8487179)
      let schedule-of-this-farmer (9 + random 10)
      set schedule schedule-of-this-farmer
      ][
      ]]]
      set farmer-type "rice"
      set selected? true

    ]
    set normalized-rice normalized-rice - 1
  ]

    while [(round (normalized-tea) > 0) and (count farmers with [selected? = false]) > 0] [
    ask one-of farmers with [selected? = false][

      set starting-hour round (random-normal 7.181818 0.7272727)
      let schedule-of-this-farmer (6 + random 10)
      set schedule schedule-of-this-farmer

      set farmer-type "tea"
      set selected? true
    ]
    set normalized-tea normalized-tea - 1
  ]

   while [(round (normalized-rubber) > 0) and (count farmers with [selected? = false]) > 0] [
    ask one-of farmers with [selected? = false][

      set starting-hour round (random-normal 5.444444 0.7777778)
      let schedule-of-this-farmer (5 + random 6)
      set schedule schedule-of-this-farmer

      set farmer-type "rubber"
      set selected? true

    ]
    set normalized-rubber normalized-rubber - 1
  ]




end


to go-working
  ask farmers with [schedule = 0][
    move-to one-of houses
    set where-i-am "home"
  ]
  ask farmers with [starting-hour <= daytime and schedule > 0][
    let going-to farmer-type
    move-to one-of patches with [land-type = going-to]
    set where-i-am farmer-type
    set schedule schedule - 1
  ]


end


to population-reporters

  ;ask one-of snakes [

  set cbr-rice count cbr-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set hnv-rice count hnv-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set rv-rice count rv-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set tv-rice count tv-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set c-krt-rice count c-krt-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set krt-rice count krt-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set ssv-rice count ssv-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set snk-rice count snakes with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set hm-rice count farmers with [farmer-type = "rice" and selected? = true and where-i-am = "rice"]
      set cbr-tea count cbr-agent with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set hnv-tea count hnv-agent with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set rv-tea count rv-agent with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set tv-tea count tv-agent with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set c-krt-tea count c-krt-agent with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set krt-tea count krt-agent with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set ssv-tea count ssv-agent with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set snk-tea count snakes with [seasonal-active? = true and active? = true and where-i-am = "tea"]
  set hm-tea count farmers with [farmer-type = "tea" and selected? = true and where-i-am = "tea"]
      set cbr-rubber count cbr-agent with [seasonal-active? = true and active? = true and where-i-am = "rubber"]
  set hnv-rubber count hnv-agent with [seasonal-active? = true and active? = true and where-i-am = "rubber"]
  set rv-rubber count rv-agent with [seasonal-active? = true and active? = true and where-i-am = "rubber"]
  set tv-rubber count tv-agent with [seasonal-active? = true and active? = true and where-i-am = "rubber"]
  set c-krt-rubber count c-krt-agent with [seasonal-active? = true and active? = true and where-i-am = "rubber"]
  set krt-rubber count krt-agent with [seasonal-active? = true and active? = true and where-i-am = "rubber"]
  set ssv-rubber count ssv-agent with [seasonal-active? = true and active? = true and where-i-am = "rice"]
  set snk-rubber count snakes with [seasonal-active? = true and active? = true and where-i-am = "rubber"]
  set hm-rubber count farmers with [farmer-type = "rubber" and selected? = true and where-i-am = "rubber"]

     file-open (word loc "/population_reporters.txt")
      file-write daytime
      file-write ","
      file-write month
      file-write ","
      file-write round-number
      file-print ","
      file-write cbr-rice
      file-write ","
      file-write hnv-rice
      file-write ","
      file-write rv-rice
      file-write ","
      file-write tv-rice
      file-write ","
      file-write krt-rice
      file-write ","
      file-write c-krt-rice
      file-write ","
      file-write ssv-rice
      file-write ","
      file-write snk-rice
      file-write ","
      file-write hm-rice
      file-write ","
      file-write cbr-tea
      file-write ","
      file-write hnv-tea
      file-write ","
      file-write rv-tea
      file-write ","
      file-write tv-tea
      file-write ","
      file-write krt-tea
      file-write ","
      file-write c-krt-tea
      file-write ","
      file-write ssv-tea
      file-write ","
      file-write snk-tea
      file-write ","
      file-write hm-tea
      file-write ","
      file-write cbr-rubber
      file-write ","
      file-write hnv-rubber
      file-write ","
      file-write rv-rubber
      file-write ","
      file-write tv-rubber
      file-write ","
      file-write krt-rubber
      file-write ","
      file-write c-krt-rubber
      file-write ","
      file-write ssv-rubber
      file-write ","
      file-write snk-rubber
      file-write ","
      file-write hm-rubber
      file-close

  ;]


end








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;               reporters
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to-report month-of-year
  report month
end

to-report time-of-day
  report daytime
end

to init-outputs
  set total-cobra (count snakes with [name = "cobra"])
  show total-cobra
end

to-report snakes-report
  set cobra-report count snakes with [name = "tree-viper"]
  report cobra-report
end


;to report-snakes-by-lluc
;
;  set total-rice-snakes count snakes-on patches with [ land-type = "rice"]
;  set total-tea-snakes count snakes-on patches with [ land-type = "tea"]
;  set total-rubber-snakes count snakes-on patches with [ land-type = "rubber"]
;  set total-forest-snakes count snakes-on patches with [ land-type = "forest"]
;  set total-home-snakes count snakes-on patches with [ land-type = "home"]
;
;  file-open (word loc "/snakebites_output_snakes.txt")
;
;      file-write "tea ,"
;      file-write month
;      file-write ","
;      file-print total-tea-snakes
;      file-write "rice ,"
;      file-write month
;      file-write ","
;      file-print total-rice-snakes
;      file-write "rubber ,"
;      file-write month
;      file-write ","
;      file-print total-rubber-snakes
;      file-write "forest ,"
;      file-write month
;      file-write ","
;      file-print total-forest-snakes
;      file-write "home ,"
;      file-write month
;      file-write ","
;      file-print total-home-snakes
;      file-close
;
;end

to reset
  reset-ticks
  clear-all-plots
end
@#$#@#$#@
GRAPHICS-WINDOW
688
10
1498
821
-1
-1
2.0
1
10
1
1
1
0
1
1
1
-200
200
-200
200
0
0
1
ticks
30.0

PLOT
6
339
372
549
plot 1
Time
Bites
0.0
12.0
0.0
15.0
true
true
"" "\n"
PENS
"snakebites" 1.0 0 -7500403 true "" "plot snakeplot"

BUTTON
14
69
77
102
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
10
159
67
204
month
month
17
1
11

MONITOR
10
210
67
255
NIL
daytime
17
1
11

CHOOSER
86
11
224
56
weather
weather
"mean" "el nino" "la nina" "location"
0

SWITCH
87
67
271
100
weighted-agreesivness
weighted-agreesivness
0
1
-1000

INPUTBOX
85
112
304
172
number-of-rounds
1.0
1
0
Number

INPUTBOX
82
220
251
280
population-of-location
200.0
1
0
Number

SWITCH
84
181
223
214
real-population
real-population
0
1
-1000

PLOT
397
379
597
529
number of snakes active
Time
Total Snakes
0.0
12.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot count snakes with [seasonal-active? = true]"

BUTTON
15
27
78
60
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
13
112
76
145
NIL
reset
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.2
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
