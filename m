From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH] execve.2: EPERM from filesystem capabilities.
Date: Wed, 9 Mar 2016 21:15:02 +0100
Message-ID: <20160309201501.GE25658@box2.japko.eu>
References: <20151012194506.GA6346@box2.japko.eu>
 <56DF7325.9030702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56DF7325.9030702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Mar 09, 2016 at 01:49:41AM +0100, Michael Kerrisk (man-pages) wrote:
>Hello Krzysztof
>
>Sorry for the delayed follow up.
>
>On 10/12/2015 09:45 PM, Krzysztof Adamski wrote:
>> An EPERM error can be returned when using filesystem capabilities and
>> capabilities to be added are not in permitted set.
>>
>> This error return values was introduced by this patch:
>> 5459c16 security: protect legacy applications from executing with
>> insufficient privilege
>
>Can you explain in more detail the scenario where EPERM can be produced.
>I can't see/produce it. Also, the code in the commit that you mention,
>which was part of Linux 2.6.27, was thoroughly changed in Linux 2.6.29.

Hi Michael,
If you're interested in details, I explained it quite extensively here:
http://k.japko.eu/systemd-nspawn-ping-debug.html

The summary is that I used nspawn from systemd which drops some 
capabilites (CAP_NET_ADMIN is amoung them) when spawning a container.  
Now, since I used Fedora in container, my ping binary had filesystem 
capabilites set:

# getcap /bin/ping
/bin/ping = cap_net_admin,cap_net_raw+ep

So when executing this application, kernel tried to give me 
CAP_NET_ADMIN capabilities but they where not on permitted set so I've 
got EPERM.

It was found in kernel 4.1 back then and I just retested this on kernel 
4.3. Unfortunately I don't have time now to verify this for the latest 
kernel but I would be surprised if this feature was removed.

Would you like me to extend/change the description in the patch somehow?

Best regards,
Krzysztof Adamski
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
