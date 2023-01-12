import SwiftUI
import shared

struct ContentView: View {

    let viewModel = CalculatorViewModel()
    @State var state: CalculatorState = CalculatorState.init(leftNumber: "0", operation: "", rightNumber: "0")

	var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            Grid {
                GridRow {
                    Text(state.label)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                        .lineLimit(1)
                        .gridCellColumns(4)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(.all)
                }
                GridRow {
                    CalculatorItemView(text: "AC", columnSpan: 1, textColor: Color.black, backgroundColor: Color("Light Gray"), action: { viewModel.clear() })
                    CalculatorItemView(text: "+/-", columnSpan: 1, textColor: Color.black, backgroundColor: Color("Light Gray"))
                    CalculatorItemView(text: "%", columnSpan: 1, textColor: Color.black, backgroundColor: Color("Light Gray"), action: { viewModel.onOperationSelected(operation: "%") })
                    CalculatorItemView(text: "÷", columnSpan: 1, backgroundColor: Color("Vivid Gamboge"), action: { viewModel.onOperationSelected(operation: "÷") })
                }
                GridRow {
                    CalculatorItemView(text: "7", columnSpan: 1, action: { viewModel.onNumberSelected(number: "7") })
                    CalculatorItemView(text: "8", columnSpan: 1, action: { viewModel.onNumberSelected(number: "8") })
                    CalculatorItemView(text: "9", columnSpan: 1, action: { viewModel.onNumberSelected(number: "9") })
                    CalculatorItemView(text: "x", columnSpan: 1, backgroundColor: Color("Vivid Gamboge"), action: { viewModel.onOperationSelected(operation: "x") })
                }
                GridRow {
                    CalculatorItemView(text: "4", columnSpan: 1, action: { viewModel.onNumberSelected(number: "4") })
                    CalculatorItemView(text: "5", columnSpan: 1, action: { viewModel.onNumberSelected(number: "5") })
                    CalculatorItemView(text: "6", columnSpan: 1, action: { viewModel.onNumberSelected(number: "6") })
                    CalculatorItemView(text: "-", columnSpan: 1, backgroundColor: Color("Vivid Gamboge"), action: { viewModel.onOperationSelected(operation: "-") })
                }
                GridRow {
                    CalculatorItemView(text: "1", columnSpan: 1, action: { viewModel.onNumberSelected(number: "1") })
                    CalculatorItemView(text: "2", columnSpan: 1, action: { viewModel.onNumberSelected(number: "2") })
                    CalculatorItemView(text: "3", columnSpan: 1, action: { viewModel.onNumberSelected(number: "3") })
                    CalculatorItemView(text: "+", columnSpan: 1, backgroundColor: Color("Vivid Gamboge"), action: { viewModel.onOperationSelected(operation: "+") })
                }
                GridRow {
                    CalculatorItemView(text: "0", columnSpan: 2, action: { viewModel.onNumberSelected(number: "0") })
                    CalculatorItemView(text: ",", columnSpan: 1, action: { viewModel.onNumberSelected(number: ",") })
                    CalculatorItemView(text: "=", columnSpan: 1, backgroundColor: Color("Vivid Gamboge"), action: { viewModel.calculate() })
                }
            }
        }.onAppear {
            viewModel.onStateChanged { state in
                self.state = state
            }
        }
	}
}
