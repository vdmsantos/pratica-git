# Prática em Duplas — Conflito de Merge e Pull Request

Git e GitHub · repositório-base da atividade (`main.dart` — Mural da Equipe).

**Objetivo:** cada dupla vai (1) provocar um conflito de propósito, (2) resolvê-lo na mão e (3) fechar o trabalho com um Pull Request.

**Base:** o arquivo `main.dart` (Mural da Equipe).

Nos exemplos usamos os nomes **Ana** (Pessoa A) e **Bruno** (Pessoa B). Troquem pelos nomes reais.

---

## 📌 Entrega da atividade

**Para entregar, coloque o LINK DO PULL REQUEST no campo de URL e o NOME DA SUA DUPLA na observação.**
![alt text](image.png)

---

## Setup da dupla

A dupla vai trabalhar em **um único repositório**: o **fork** que a Pessoa A criar. As duas pessoas precisam de acesso de escrita — por isso o passo de colaborador.

**Pessoa A (Ana)**

1. Acesse **https://github.com/vdmsantos/pratica-git** e clique em **Fork → Create fork**. Você terá sua cópia: `https://github.com/USUARIO-DA-ANA/pratica-git`.
2. No seu fork, vá em **Settings → Collaborators → Add people** e adicione o **username do Bruno**.

**Pessoa B (Bruno)**

3. Aceite o convite de colaborador (chega por e-mail e nas notificações do GitHub).

**As duas pessoas**

4. Clonem o **mesmo** repositório (o fork da Ana), cada um na sua máquina:

```bash
git clone https://github.com/USUARIO-DA-ANA/pratica-git.git
cd pratica-git
```

> ✅ **Checkpoint:** as duas máquinas têm a pasta do projeto com o `main.dart`.

---

## Parte 1 — Cada pessoa na sua branch

As duas pessoas vão editar **a mesma linha** do `main.dart` (a marcada com `EDITE A LINHA ABAIXO`). É isso que gera o conflito.

**Pessoa A (Ana)**

```bash
git checkout -b feature/saudacao-ana
```

No editor, troque a linha `'Escreva aqui a saudacao da equipe',` por:

```dart
    'Ola! Aqui e a Ana, bora codar!',
```

Salve e envie a branch:

```bash
git add main.dart
git commit -m "feat: adiciona saudacao da Ana"
git push -u origin feature/saudacao-ana
```

**Pessoa B (Bruno) — mexendo na MESMA linha**

```bash
git checkout -b feature/saudacao-bruno
```

Troque a **mesma** linha por:

```dart
    'Fala galera! Bruno na area.',
```

Salve e envie:

```bash
git add main.dart
git commit -m "feat: adiciona saudacao do Bruno"
git push -u origin feature/saudacao-bruno
```

> ✅ **Checkpoint:** no GitHub, em **Branches**, aparecem `feature/saudacao-ana` e `feature/saudacao-bruno`.

---

## Parte 2 — O primeiro PR entra sem conflito

**Pessoa A (Ana)**

1. No GitHub, vá em **Pull requests → New pull request**.
2. Configure: **base: `main`** ← **compare: `feature/saudacao-ana`**.
3. Clique em **Create pull request**, escreva um título e confirme.
4. Como o `main` ainda não mudou, aparece **"Able to merge"**. Clique em **Merge pull request → Confirm merge**.

Agora o `main` já tem a saudação da Ana.

> ✅ **Checkpoint:** na página do repositório, o `main.dart` mostra a linha da Ana.

---

## Parte 3 — O conflito aparece e a dupla resolve

O Bruno tem uma mudança na **mesma linha** que a Ana já colocou no `main`. Isso é um conflito.

**Pessoa B (Bruno) — traga o main e tente juntar**

```bash
git checkout main
git pull                      # baixa a saudacao da Ana
git checkout feature/saudacao-bruno
git merge main                # aqui aparece o CONFLITO
```

Abra o `main.dart`. A linha em conflito vira isto:

```dart
<<<<<<< HEAD
    'Fala galera! Bruno na area.',
=======
    'Ola! Aqui e a Ana, bora codar!',
>>>>>>> main
```

**Entendendo os marcadores:**

- `<<<<<<< HEAD` → o que está na **sua** branch (Bruno).
- `=======` → a linha divisória.
- `>>>>>>> main` → o que veio do **main** (a mudança da Ana).

A dupla decide o que fica. Combinem manter as duas mensagens. Apague os marcadores e deixe assim:

```dart
    'Ola! Aqui e a Ana, bora codar!',
    'Fala galera! Bruno na area.',
```

> ⚠️ **Atenção:** apaguem as três linhas de marcadores (`<<<<<<<`, `=======`, `>>>>>>>`). Não pode sobrar nenhuma.

Salve e finalize o merge:

```bash
git add main.dart
git commit -m "merge: resolve conflito juntando as saudacoes"
git push
```

> ✅ **Checkpoint:** rode `git status` — deve dizer "nothing to commit, working tree clean".

---

## Parte 4 — O Pull Request final

**Pessoa B (Bruno)**

1. No GitHub: **Pull requests → New pull request**, com **base: `main`** ← **compare: `feature/saudacao-bruno`**.
2. Agora aparece **"Able to merge"** (o conflito já foi resolvido).
3. **Create pull request** e depois **Merge pull request → Confirm merge**.

As duas pessoas atualizam o `main` final:

```bash
git checkout main
git pull
```

Abram o `main.dart`: as **duas saudações** estão lá. Fim! 🎉

> ✅ **Checkpoint:** o `main` tem as duas saudações; `git log --oneline` mostra os dois trabalhos + o merge.

**Não esqueçam:** copiem o **link do Pull Request** e entreguem junto com o **nome da dupla** (ver seção _Entrega da atividade_, no topo).

---

## Inverter os papéis (opcional)

Se sobrar tempo, repitam trocando quem é A e quem é B, editando outra linha (por exemplo `'Bons commits para todos.'`). Assim as duas pessoas praticam resolver o conflito.

---

## Cola de comandos da prática

```bash
git clone <url>                 # copiar o repositorio da dupla (fork da Ana)
git checkout -b feature/<nome>  # criar e mudar para sua branch
git add main.dart               # preparar a mudanca
git commit -m "feat: ..."       # salvar
git push -u origin feature/<nome> # enviar a branch pela primeira vez
git checkout main                 # voltar para o main
git pull                        # baixar o que mudou no GitHub
git merge main                  # juntar o main na sua branch (pode dar conflito)
git status                      # ver o estado (use SEMPRE)
git log --oneline               # ver o historico
```

Na dúvida, rode `git status` e chame o professor.
