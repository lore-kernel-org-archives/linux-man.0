From: Sebastian Huber <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org>
Subject: Re: PTHREAD_CLEANUP_PUSH_DEFER_NP(3)
Date: Tue, 09 Jul 2013 10:07:17 +0200
Message-ID: <51DBC4B5.1080803@embedded-brains.de>
References: <51D588FC.6070701@embedded-brains.de> <CAKgNAkimJbCdJ6W_+1qaM1KpCxFAN5EfzbMF_PDBC7vcXcb6dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkimJbCdJ6W_+1qaM1KpCxFAN5EfzbMF_PDBC7vcXcb6dA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

On 07/09/2013 04:34 AM, Michael Kerrisk (man-pages) wrote:
> Sebastian,
>
> On Thu, Jul 4, 2013 at 4:38 PM, Sebastian Huber
> <sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org> wrote:
>> Hello,
>>
>> I think there is an error in the description
>>
>>         is equivalent to (but shorter and more efficient than):
>>
>>             int oldtype;
>>
>>             pthread_cleanup_push(routine, arg);
>>             pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldtype)=
;
>>             ...
>>             pthread_setcanceltype(oldtype, NULL);
>>             pthread_cleanup_pop(execute);
>>
>> this should be instead
>>
>>         is equivalent to (but shorter and more efficient than):
>>
>>             int oldtype;
>>
>>             pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldtype)=
;
>>             pthread_cleanup_push(routine, arg);
>>             ...
>>             pthread_cleanup_pop(execute);
>>             pthread_setcanceltype(oldtype, NULL);
>
>
> I am doubtful of this, but, can you provide some evidence to support =
your claim?

ok, I looked at the pthread.h of glibc and this seems to be not a man p=
age=20
problem, but a glibc bug/feature.

I thought that the pthread_cleanup_push_defer() solves the problem high=
lighted=20
in this example:

http://www.sourceware.org/pthreads-win32/manual/pthread_cleanup_push.ht=
ml

I will address this on a glibc list.  Sorry for the noise.

--=20
Sebastian Huber, embedded brains GmbH

Address : Dornierstr. 4, D-82178 Puchheim, Germany
Phone   : +49 89 189 47 41-16
=46ax     : +49 89 189 47 41-09
E-Mail  : sebastian.huber-L1vi/lXTdtsBbLBgBO8hYIQuADTiUCJX@public.gmane.org
PGP     : Public key available on request.

Diese Nachricht ist keine gesch=E4ftliche Mitteilung im Sinne des EHUG.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
