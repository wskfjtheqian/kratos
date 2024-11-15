{{$svrType := .ServiceType}}
{{$svrName := .ServiceName}}
{{$fileName := .FileName}}

export class {{.ServiceType}}Client {
{{range .MethodSets}}
	{{- if ne .Comment ""}}
	{{.Comment}}
	{{- end}}
    {{.Name}}(req: {{$fileName}}.{{.Name}}Request): Promise<axios.AxiosResponse<{{$fileName}}.{{.Name}}Reply>> {
        return request({
            url: "{{.Path}}",
            method: "{{.Method}}",
        })
    }
{{end}}
}
