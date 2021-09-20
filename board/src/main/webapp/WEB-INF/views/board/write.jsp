<style>
    html, body, #editor {
        margin: 0;
        height: 100%;
        font-family: 'Helvetica Neue', Arial, sans-serif;
        color: #333;
    }

    textarea, #editor div {
        display: inline-block;
        width: 49%;
        height: 100%;
        vertical-align: top;
        box-sizing: border-box;
        padding: 0 20px;
    }

    textarea {
        border: none;
        border-right: 1px solid #ccc;
        resize: none;
        outline: none;
        background-color: #f6f6f6;
        font-size: 14px;
        font-family: 'Monaco', courier, monospace;
        padding: 20px;
    }

    code {
        color: #f66;
    }
</style>
<!-- marked 의 역할 : 마크다운 해석기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.6/marked.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.3.4/vue.min.js"></script>
<!-- 유틸리티 라이브러리 역할 : debounce -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js"></script>
<script>
    new Vue({
        el: '#editor',
        data: {
            input: "# 헬로우",
            rs:''
        },
        methods:{
            // debounce : 더 이상 입력이 없을 때 까지 0.5초 기다린 후 실행한다. */
            update: _.debounce(function(e) {
                this.input = e.target.value;
                this.rs = marked(this.input, { sanitize: true });
            }, 500)
        }
    });
</script>
</head>
<body>
<div id="editor">
    <textarea :value="input" @input="update"></textarea>
    <div v-html="rs"></div>
</div>