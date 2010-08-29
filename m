From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for epoll_ctl.2
Date: Sun, 29 Aug 2010 14:23:37 +0200
Message-ID: <AANLkTimn0KicNE-8=95k_ytMUFnBu=D1Gc_Qk5bR5KJq@mail.gmail.com>
References: <20100814095315.0b88bf18@keeper.home.local> <AANLkTimYDbQ5F2kFDF+rn2JFS7g42VvmrYq7679N4XWJ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimYDbQ5F2kFDF+rn2JFS7g42VvmrYq7679N4XWJ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Aug 29, 2010 at 11:43 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> On 2010/8/14 Yuri Kozlov wrote:
>> Hello.
>> --- man-pages-git/man2/epoll_ctl.2 =A0 =A0 =A02010-03-26 17:46:41.00=
0000000 +0300
>> +++ /tmp/epoll_ctl.2 =A0 =A02010-08-14 09:51:09.000000000 +0400
>> @@ -81,12 +81,12 @@
>> =A0typedef union epoll_data {
>> =A0 =A0 void =A0 =A0 =A0 =A0*ptr;
>> =A0 =A0 int =A0 =A0 =A0 =A0 =A0fd;
>> - =A0 =A0__uint32_t =A0 u32;
>> - =A0 =A0__uint64_t =A0 u64;
>> + =A0 =A0uint32_t =A0 u32;
>> + =A0 =A0uint64_t =A0 u64;
>> =A0} epoll_data_t;
>>
>> =A0struct epoll_event {
>> - =A0 =A0__uint32_t =A0 events; =A0 =A0 =A0/* Epoll events */
>> + =A0 =A0uint32_t =A0 events; =A0 =A0 =A0/* Epoll events */
>> =A0 =A0 epoll_data_t data; =A0 =A0 =A0 =A0/* User data variable */
>> =A0};
>> =A0.fi
>
> Hello Michael,
>
> This patch (found in e4123e51) breaks alignment of C comments, usuall=
y
> you align them when describing data structures.
>
> Denis


Thanks Denis,

=46ixed now.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
