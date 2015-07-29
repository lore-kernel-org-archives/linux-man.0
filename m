From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: Re: [PATCH man v3] bpf.2: various updates/follow-ups to address some
 fixmes
Date: Wed, 29 Jul 2015 09:27:30 +0200
Message-ID: <55B88062.6090505@iogearbox.net>
References: <86038f69cd3d753350b9947b675365fb7fe9da60.1438114491.git.daniel@iogearbox.net> <20150729055811.GH21252@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150729055811.GH21252@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/29/2015 07:58 AM, Mike Frysinger wrote:
> On 28 Jul 2015 22:25, Daniel Borkmann wrote:
>> -.BR bpf ()
>> +.BR bpf (2)
>
> i thought the style for man pages was to not include the section number for the
> function you're currently documenting.  since this is already the bpf(2) page,
> it should use "bpf()" and not "bpf(2)".  other man pages though should use
> "bpf(2)".

Ok, I was not aware of that. This accounts for the entire man page?

There are a couple of other spots using bpf(2), so I would fix them as well in v4.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
