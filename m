From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: Re: [PATCH man] tcp.7: improve paragraphs on tcp_ecn and add tcp_ecn_fallback
 bullet
Date: Fri, 11 Sep 2015 11:18:13 +0200
Message-ID: <55F29C55.7000600@iogearbox.net>
References: <381a72e4388904195a6b4bae56e40fed965f9cd8.1440590425.git.daniel@iogearbox.net> <55F29BF2.3000408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55F29BF2.3000408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/11/2015 11:16 AM, Michael Kerrisk (man-pages) wrote:
...
>> +.IP 2
>> +Enable ECN when requested by incoming connections,
>> +but do not request ECN on outgoing connections.
>
> I also added a note here that option 2 first appeared in Linux 2.6.31.

Great, thanks a lot!
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
