From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] intro.1: some improvements
Date: Tue, 10 Mar 2015 09:53:23 +0100
Message-ID: <54FEB103.6070200@gmail.com>
References: <54F6BBC0.4010401@gmail.com> <1425932797-16050-1-git-send-email-saulery@free.fr> <54FE8A86.9040405@gmail.com> <20150310074041.GA1627@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150310074041.GA1627-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane

[I'll reorder the text a mail a little for ease of reply]

>> I'm not sure that we really need most of the above piece. I mean, in=
 these=20
>> days of GUI and laptops. Most of us use the GUI or close the lid to=20
>> shutdown/suspend.
>=20
> I use startx / shutdown, so it does not shock me. This addition and t=
he
> other I have proposed that the reader knows what to do if X does not
> start.

Okay. So, some observations:

1. I've never been a huge fan of the extended intro.1 page. I just thin=
k
   it's a little out of place as man page. For the most part, tutorials
   are best put somewhere else. That said, the intro(1) page was alread=
y
   there when I arrived as maintainer, and I'm not so disturbed by
   the tutorial content that I want to eliminate it. I will even take
   reasonable additions to it.

2. I don't want this page to grow enormous.

3. I'd like it to focus on the commonly used commands. Or, where it=20
   covers less commonly used commands, then a few words of explanation
   are in order. For example, one could say: "Although the X Windows
   system is commonly started automatically, and the system is shut dow=
n
   or suspended through a graphical interface, there are commands that
   can be used from the shell to perform each of these steps..."
   See what I mean?

> If you do not want, no problem, but now the page is incoherent:
>=20
> - Control-D was moved to the non-added portion
> - Su (1), shutdown (8) in excess in SEE ALSO

Good point. So, some clean up is needed. Could you take a look?
But see comments below.

> Le mardi 10 mars 2015 =C3=A0 07:09:10, Michael Kerrisk (man-pages) a =
=C3=A9crit :
>>
>> I applied most of the patch, but...
>>
>> On 03/09/2015 09:26 PM, St=C3=A9phane Aulery wrote:
>>> - Add a section Logout and poweroff and change login/logout by open=
/close session
>>
>> ... not this first piece. See comments below.

So, a metacomment. This piece really would have been better as a
separate patch, since it's rather a new topi, and then we could
have started this conversation sooner, and also avoided the small
incoherent piece that we now have.

I would probably take a patch that covers this stuff, but addresses my=20
idea above. But see also the comments below.

>>> +.SS Logout and poweroff
>>> +When you work is finished,
>>> +you can press Control-D to close the current session.

This text is confusing. What is the "current session"?

>>> +This does not turn off the machine.

What is "This"? I think it's confusing to bring together the
discussion of terminating a shell session and shutting down the system.

>>> +Only superusers have access to this command.

What is "this command"?

>>> +If you are the single user you can also not log off

What is "the single user"?

>>> +and becoming a superuser by typing the command
>>> +.BR su (1).

In general, I can't understand what the last sentence is trying=20
to say...

>>> +Also you must type yours password.

s/yours/your/

>>> +Finally enter the command "shutdown -P +1",
>>> +which will turn off the computer after one minute.
>>> +See
>>> +.BR shutdown (8).

So, you see pat of my problem was also that I think the text=20
still needed much work. I should have explained that, but I=20
left off to so, since I was not convinced we need this stuff=20
in general. (But, if you want to do the work to make something,
I will probably take it.)

I'd propose this, if you want to try and add these pieces:

* Split any discussion of closing a shell session off into a=20
  separate piece.
* Explain startx if you want.
* Explain shutdown if you want.

But, I think all of these pieces are more or less
orthogonal and should be explained separately.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
