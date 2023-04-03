using Plots
opcao = ""
meses = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
semana = ["seg","ter","qua","qui", "sex","sab", "dom"]
despesas = zeros(12)
ganhos = zeros(12)
horas = zeros(7)

while opcao != "0" #loop
    print( """
 
    
╔═╗┌─┐┬─┐┌─┐┌┬┐┌─┐┬─┐  ┌┬┐┌─┐  ╔═╗┬─┐┌─┐┌─┐┬┌─┐┌─┐┌─┐
║ ╦├┤ ├┬┘├─┤ │││ │├┬┘   ││├┤   ║ ╦├┬┘├─┤├┤ ││  │ │└─┐
╚═╝└─┘┴└─┴ ┴─┴┘└─┘┴└─  ─┴┘└─┘  ╚═╝┴└─┴ ┴└  ┴└─┘└─┘└─┘


""")

    println( "\n============= MENU ==============\n")
    println( "1.Criar um gráfico de gastos durante o ano\n")
    println( "2.Criar um gráfico de ganhos durante o ano\n")
    println( "3.Gráfico de horas trabalhadas na semana \n ")
    println("0 - Sair \n ")
    print("\nDigite uma opção: ")
    global opcao = readline(stdin)
    
    # estrutura de seleção 
    if opcao == "1"
        for a = 1:12 # configura um loop que itera sobre um intervalo de valores de 1 a 12 (inclusive), usando a variável 'a' como contador de loop.
            mes = meses[a]
            print("$mes: ")
            global despesas[a] = parse(Float64, readline(stdin))
        end

        bar(meses,
        [despesas], 
        title="Gastos Anuais", 
        xlabel="Mês", 
        ylabel="Valor (RS)", 
        marker=:circle,
        markercolormap =:viridis)

        savefig("gastos.png")
    elseif opcao =="2"
        for b = 1:12 # configura um loop que itera sobre um intervalo de valores de 1 a 12 (inclusive), usando a variável 'b' como contador de loop.
            mes =meses[b]
            print("$mes:")
            global ganhos[b] = parse(Float64, readline(stdin))
        end
        bar(meses, 
        [ganhos], 
        title="Ganhos Anuais", 
        xlabel="Mês", 
        ylabel="Valor (RS)", 
        marker=:circle,
        markercolormap =:viridis)
        savefig("ganhos.png")
    elseif opcao =="3"
        print("Se não trabalhou por favor deixar o dia em branco e precionar enter \n")
        for c = 1:7 # configura um loop que itera sobre um intervalo de valores de 1 a 7 (inclusive), usando a variável 'c' como contador de loop.
            dia = semana[c]
            print("digite aqui,$semana:")
            global horas[c] = parse(Int64, readline(stdin))
        end
        plot(semana, 
        [horas], 
        title="Horas Trabalhadas", 
        xlabel="Semana", 
        ylabel="Horas", 
        marker=:circle,
        markercolormap =:viridis)
        savefig("horas.png")

    elseif opcao == "0"
        return(0)
    elseif opcao != "0"
        # opção inválida
        println("Opção inválida. Tente novamente.\n")
    end
end

println("Saindo do programa...\n")