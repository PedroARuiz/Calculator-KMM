//
// Created by Pedro Antonio Ruiz Cuesta on 7/1/23.
// Copyright (c) 2023 orgName. All rights reserved.
//

import SwiftUI

struct CalculatorItemView: View {
    let text: String
    var columnSpan: Int = 1
    var textColor: Color = Color.white
    var backgroundColor: Color = Color("Dark Liver")
    var action: () -> Void = { }
    var body: some View {
        Button(action: action) {
            Circle()
                    .foregroundColor(backgroundColor)
                    .overlay {
                        Text(text)
                                .font(.title)
                                .foregroundColor(textColor)
                    }
        }.gridCellColumns(columnSpan)
    }
}
