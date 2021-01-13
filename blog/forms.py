from django import forms
from django.forms.widgets import ClearableFileInput
from .models import Post

class PostForm(forms.ModelForm):
    image = forms.ImageField(widget=ClearableFileInput, required=False)

    class Meta:
        model = Post
        fields = ('title', 'text', 'image', 'video')
        widgets = {
            'title': forms.TextInput(attrs={
                'class': 'form-control',
                'maxlength': 20,
            }),
            'text': forms.Textarea(attrs={'class': 'form-control'})
        }

        error_messages = {
            'title':{
                'required': 'O título nome é obrigatório'
            },
            'descricao':{
                'required': 'A descrição é obrigatória'
            },
            'video': {
                'required': 'O vídeo é obrigatório'
            }

        }