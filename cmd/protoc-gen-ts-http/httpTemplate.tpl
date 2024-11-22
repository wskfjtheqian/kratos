{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}
{{$fileName := .FileName}}

class {{.ServiceType}}Client {
{{range .MethodSets}}
	{{- if ne .Comment ""}}
	{{.Comment}}
	{{- end}}
    {{.LowerName}}(req: {{$fileName}}.{{.Name}}Request): Promise<axios.AxiosResponse<{{$fileName}}.{{.Name}}Reply>> {
        return request({
            url: "{{.Path}}",
            method: "{{.Method}}",
            {{- if or (eq .Method "PUT") (eq .Method "POST")}}
            data: req,
            {{- else}}
            params: req,
            {{- end}}
        })
    }
{{end}}
}

export const {{.LowerServiceType}}Client = new {{.ServiceType}}Client()