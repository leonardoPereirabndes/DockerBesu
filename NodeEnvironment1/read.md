Iniciando um Nó 


# 1.	Iniciando contêiner
Vamos começar iniciando nossos contêineres docker. Para isso, precisamos começar nossa configuração editando o arquivo configEnv.txt , nesse arquivo você poderá dizer o nome de cada nó que pretende usar, dividido em 3 classes de nós boot, validator e  writer. 

          bootNode=(boot1 boot2 boot3) 
          validatorNode=(validator1 validator2 validator3) 
          writerNode=(writer1 writer2 writer3)

inicialmente o arquivo esta configurado para iniciar com 3 boot, 3 validator e 3 writer. Além disso, temos uma quarta entrada que é o validator initial, nessa entrada precisamos definir um validator entre os validator definidos em validatorNode.

# 1.1. Criando container
Após ter sido configurado o arquivo configEnv.txt, precisamos executar o script criandocontainer.sh. 
```
./criandocontainer.sh 
```
# 2. adicionando chave particular
Após o passa 1 ter sido executado, você vai perceber que foi criado uma pasta para cada nó, nessa pasta você pode adicionar as chaves privadas dos nó caso as tenha
# 3. configurando o nó	
Nesse passo você vai criar as chaves privadas de cada nó e definir o campo extraData para ser adicionado no genesis
```
./initialsetting.sh
```	
Você vai encontrar na saída do seu terminal o valor do extraData, que você pode adicionar no genesis

# 4. copiar genesis	
Substitua o seu arquivo genesis pelo arquivo genesis que esta no diretório e rode 
```
./copygenesis.sh 
```
Esse script ira copiar o arquivo genesis para a pasta de cada nó 

# 5. start e stop	
Agora temos os scripts de start e stop, neles você pode iniciar um nó ou parar um nó dizendo o nome do contêiner que você pretende iniciar ou parar.
