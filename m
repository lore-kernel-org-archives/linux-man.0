From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: New random(7) page for review
Date: Tue, 15 Nov 2016 07:41:12 +0100
Message-ID: <9e252f2a-4699-4377-750e-941c19e6bbec@gmail.com>
References: <1470052099.2926.6.camel@redhat.com>
 <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
 <1478778837.2642.26.camel@redhat.com>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1@gmail.com>
 <4a8c573c-0c19-29d0-248e-74c088968806@gmail.com>
 <d5eca965-c8b9-51e5-6acb-172e47f85ba0@supelec.fr>
 <cb25213c-a70d-cbf1-6a42-959dcdc1f202@gmail.com>
 <20161113222041.ypnz3sdm3fmjprnn@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161113222041.ypnz3sdm3fmjprnn-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Thomas_H=c3=bchn?= <t@2uo.de>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org=?UTF-8?Q?Thomas_H=c3=bchn?= <t@2uo.de>
List-Id: linux-man@vger.kernel.org

Hi Ted,

On 11/13/2016 11:20 PM, Theodore Ts'o wrote:
> On Sat, Nov 12, 2016 at 01:25:11PM +0100, Michael Kerrisk (man-pages) wrote:
>>     ┌──────────────┬──────────────┬──────────────────┬────────────────────┐
>>     │Interface     │ Pool         │ Blocking         │ Behavior in early  │
>>     │              │              │ behavior         │ boot time          │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │/dev/random   │ Blocking     │ If entropy too   │ Blocks until       │
>>     │              │ pool         │ low, block until │ enough entropy     │
>>     │              │              │ there is enough  │ gathered           │
>>     │              │              │ entropy again    │                    │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │/dev/urandom  │ CSPRNG out‐  │ Never blocks     │ Returns output     │
>>     │              │ put          │                  │ from uninitialized │
>>     │              │              │                  │ CSPRNG (may be low │
>>     │              │              │                  │ entropy and        │
>>     │              │              │                  │ unsuitable for     │
>>     │              │              │                  │ cryptography)      │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ Does not block   │ Blocks until pool  │
>>     │              │ /dev/urandom │ once pool ready  │ ready              │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ If entropy too   │ Blocks until pool  │
>>     │GRND_RANDOM   │ /dev/random  │ low, block until │ ready              │
>>     │              │              │ there is enough  │                    │
>>     │              │              │ entropy again    │                    │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ Does not block   │ EAGAIN if pool not │
>>     │GRND_NONBLOCK │ /dev/urandom │                  │ ready              │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ EAGAIN if not    │ EAGAIN if pool not │
>>     │GRND_RANDOM + │ /dev/random  │ enough entropy   │ ready              │
>>     │GRND_NONBLOCK │              │ available        │                    │
>>     └──────────────┴──────────────┴──────────────────┴────────────────────┘
> 
> I would change the rightmost column to be "Behavior when pool not yet
> ready", and just the text in that column accordingly.

Yes, better. Changed.

> And the cell, getrandom() GRND_NONBLOCK and blocking behavior, "does
> not block" is not quite right.  It's EAGAIN if pool not ready.
>
> This distinguishes this from /dev/urandom & blocking behavior's "Never
> blocks", in that it will return potentially not fully secure
> randomness if the pool is not initialized.

I see what you mean, but I think Laurent meant that point to be covered
in the rightmost column. So, to try to make this clearer, I changed the
text in that cell to "Does not block once the pool is read". If this still
seems problematic, let me know for the next version of the page. (I'll
send out a new draft in a moment.)
 
Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
