From: Kees Cook <keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: IPPROTO_ICMP
Date: Sat, 3 Dec 2016 12:06:18 -0800
Message-ID: <CAGXu5jKUZBGiELyLKaxbKNtucE+2fsCAYGJrH-iDZdpgaB1+bA@mail.gmail.com>
References: <CAGXu5jLwj7p_ueaz-vEH_MJLC_xxwpXUT_GFLAnMOvdh7HUxmQ@mail.gmail.com>
 <5842BDE4.3010204@bfs.de> <5e52b0bd-6465-7432-8e79-3c835627d73d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5e52b0bd-6465-7432-8e79-3c835627d73d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: wharms-fPG8STNUNVg@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Dec 3, 2016 at 6:15 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/03/2016 01:43 PM, walter harms wrote:
>>
>>
>> Am 03.12.2016 05:58, schrieb Kees Cook:
>>> Hi,
>>>
>>> So, while playing with IPPROTO_ICMP[1], I rediscovered the sysctl
>>> needed to use it, and went to make sure that it was covered in the
>>> man-pages. It is, in man.7 (ping_group_range), though there is no
>>> mention of IPPROTO_ICMP there. Also, it seems that socket.2 says to
>>> either look at protocols.5 (which just talks about the file) or ip.7
>>> for AF_INET. ip.7 says:
>>>
>>>        udp_socket = socket(AF_INET, SOCK_DGRAM, 0);
>>>
>>> And continues to make assumptions that IPPROTO_ICMP doesn't exist:
>>> "SOCK_DGRAM to  open a  udp(7) socket", "The  only  valid  values  for
>>> protocol  are ... 0 and IPPROTO_UDP", etc. Additionally, EACCESS is
>>> missing the error condition for not having ping_group_range set
>>> correctly.
>>>
>>> Does it make sense to put IPPROTO_ICMP details in ip.7? Or is there a
>>> better place to list it? Are there additional details beyond what I
>>> pointed out that should be updated in ip.7?
>>>
>>> Thanks!
>>>
>>> -Kees
>>>
>>> [1] https://lwn.net/Articles/443051/
>>>
>>
>> Interesting, i have never heard about it.
>> But i would suggest this as a special chapter in ICMP(7).
>>
>> When I would search for information about ping, i would go to icmp
>> not to IP.
>
> Yes, icmp(7) would be the right place I think.
>
> Do yo plan to write a patch, Kees?

Yeah, I can. I wanted to know where to put the bulk of it. I think
some minor reorganization of ip.7 is needed too (to account for
SOCK_DRAM not being only UDP with AF_INET).

-Kees

-- 
Kees Cook
Nexus Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
