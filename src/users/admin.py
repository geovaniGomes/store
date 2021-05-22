from django.contrib import admin
from django.contrib.auth import admin as auth_admin

from .forms import UserChangeForm, UsercreateForm
from .models import User


@admin.register(User)
class UserAdmin(auth_admin.UserAdmin):
    form = UserChangeForm
    add_form = UsercreateForm
