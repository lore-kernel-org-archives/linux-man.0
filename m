From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getrandom(2): return type mismatch for getrandom()
Date: Fri, 15 Sep 2017 17:00:22 +0200
Message-ID: <CAKgNAkjm8+9LVCVaYhYyRJe1eG4sFaNeo-dAL6UU9Js_FkVfbA@mail.gmail.com>
References: <a1b295b6-1e5d-6e5b-20db-fb5f3b09a72c@esse.ch> <CAKgNAkhU-eC+ns99H0sqHpgOOSbwSMi+Vb=Sw1ufBTYoOrmy7A@mail.gmail.com>
 <38409769-c82a-594d-a58e-401e86891c67@esse.ch>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <38409769-c82a-594d-a58e-401e86891c67-VLnxIkhT3pI@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Fabio,

On 15 September 2017 at 16:00, Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org> wrote:
> Dear Michael,
>
> I'm sorry for the late response, I didn't notice when the commit made it
> in.  It seems like your fix just introduced another, though more minor
> issue unless I misunderstand something.
>
> The man page now says the return type is "ssize" instead of "ssize_t".
> Is that really what you meant to write?
>
> I apologize for any confusion I may have caused.

Thanks for spotting that. I've fixed that for the next man-pages release.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
