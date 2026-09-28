@Entry
@Component
struct Index {
  // A számláló állapota - ha ez változik, az UI automatikusan frissül
  @State count: number = 0;

  // Segédfunkció a szám színének meghatározásához
  getCountColor(): Color {
    if (this.count > 0) {
      return Color.Green;
    } else if (this.count < 0) {
      return Color.Red;
    }
    return Color.Gray;
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        // Címsor
        Text('ArkTS Számláló')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)

        // A számláló értéke dinamikus színnel
        Text(`${this.count}`)
          .fontSize(64)
          .fontWeight(FontWeight.Bolder)
          .fontColor(this.getCountColor())
          .animation({ duration: 200 }) // Finom átmenet az értékváltáskor

        // Gombok elrendezése egy sorban
        Row({ space: 12 }) {
          // Csökkentő gomb
          Button('-1')
            .width(80)
            .height(45)
            .backgroundColor('#E53935')
            .onClick(() => {
              this.count--;
            })

          // Nullázó gomb
          Button('Reset')
            .width(90)
            .height(45)
            .backgroundColor('#757575')
            .onClick(() => {
              this.count = 0;
            })

          // Növelő gomb
          Button('+1')
            .width(80)
            .height(45)
            .backgroundColor('#43A047')
            .onClick(() => {
              this.count++;
            })
        }
      }
      .width('100%')
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}