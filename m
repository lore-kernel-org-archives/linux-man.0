From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: aio_cancel
Date: Sat, 08 Oct 2011 23:42:12 +0100
Message-ID: <4E90D1C4.3090104@jguk.org>
References: <CAGc9Evf=94fyfYM67q0BRJCN=vu14aYV91pE+Hw=uhgkVS5p5g@mail.gmail.com> <CAKgNAkgcKRrdepNS9jQw=MzNY+sRpP+-idDEfpT0ALBJOJ3w1w@mail.gmail.com> <4E8BA018.5070707@jguk.org> <CAKgNAkhdZwP7hVH2GdmMV9CH4LTXURbO=TrAg0QgiG7_XXdQFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhdZwP7hVH2GdmMV9CH4LTXURbO=TrAg0QgiG7_XXdQFg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote, On 05/10/11 05:37:
> On Wed, Oct 5, 2011 at 2:08 AM, Jon Grant<jg-hus3n9K41k0@public.gmane.org>  wrote:
[.]
>> Could I ask a related question. When an aio block is cancelled, is there
>> anyway to get back the byte count that was processed? e.g. aio_read, the
>> number of bytes read before the operation was cancelled.
>
> Offhand, I don't know. What happens if you try aio_return() +
> aio_error()? When you find out, send me a patch!

I wrote a small program to write 30MB to a file with aio_write. 
aio_cancel immediately after enqueing. aio_cancel returnend -1, and 
errno was AIO_NOTCANCELED, so I guess it is not possible to cancel in my 
Ubuntu glibc build.



BTW, could this aio_cancel text be updated to clarify if aio_error or 
aio_cancel is returning AIO_ALLDONE.

" This function returns AIO_ALLDONE if
        all requests had already been completed before this call.  When 
some error
        occurs, -1 is returned, and errno is set appropriately."

My assumption would be that it refers to aio_Cancel, but as it follows 
aio_error description.. could be unclear. Maybe the function name can be 
added to the description.


Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
