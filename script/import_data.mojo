## abrir powershell e copiar >>> pyinstaller --onefile script_import_excel.py
## IMPORTS
import openpyxl as xl
import pandas as pd
import os
import copy

## COPY RELATIVE PATH DA PASTA COM OS FICHEIROS XLSX
modelDir = 'excel_ficheiros'

## LISTAR TODOS OS FICHEIROS NA PASTA
files = os.listdir(modelDir)

## VARIAVEL PARA RECEBER DADOS
data = []

## PERCORRER TODOS OS FICHEIROS E GUARDAR OS DADOS NA VAR DADOS
conf = pd.read_excel('CONFIGURAR.xlsx')

## for each file in folder
for f in files:
    try:
        #print(f)
        ## LOAD THE WORKBOOK 
        wb = xl.load_workbook(modelDir + str("\\") + f, data_only=True)
        ## escolher nome do cabeçalho e atribuir o valor
        aux = {}
        for i, r in conf.iterrows():
            aux['Ficheiro'] = f
            if r['Sheet'] == 'active':
                aux[r['Head']] = wb.active[r['row_n']].value
            else:
                aux[r['Head']] = wb[r['Sheet']][r['row_n']].value
            #print(i)
            #print(r)
            #print(aux)
        ## GUARDAR EM DADOS
        data.append(copy.deepcopy(aux))
        ##VALIDAR ERROS
    except Exception as e:
        print('ERR:', f, str(e))
    #break

## EXPORTAR O RESULTADO PARA EXCEL
df = pd.DataFrame(data)
print(df.shape)
print(df.head())

df.to_excel('base_dados_importada.xlsx', index = False)


print(">>> Importação concluída! <<<")
