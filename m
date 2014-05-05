From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fanotify man pages for review
Date: Mon, 05 May 2014 11:39:14 +0200
Message-ID: <53675C42.6000706@gmail.com>
References: <20140505090940.GA4989@silvan-xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140505090940.GA4989@silvan-xps13>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/05/2014 11:09 AM, Silvan Jegen wrote:
> Hi
> 
>> Heinrich Schuchardt has made a magnificent effort writing some man 
>> pages that extensively document the fanotify API that you added in 
>> Linux 2.6.36/37. Could I ask you (and anyone else who is interested)
>> to review them please for completeness and accuracy. I would
>> really like to get such a review before publishing the pages, in
>> order to minimize the chance of publishing errors
> 
> I did a quick and dirty spell check and found the following two simple
> spelling mistakes.
> 
> 
>> +via their inode number and to mounts via their mount ID.
>> +If files or directories are renamed or moved, the respective entries survive.
>> +If files or directories are deleted or mounts are unmounted, the corresponding
>> +entries are deleted.
>> +.SS The event queue
>> +As events occur on the filesystem objects monitired by a notification group,
> 
> s/monitired/monitored/
> 
> 
>> +signals which events have occurred for a single filesystem object.
>> +Multiple bits may be set in this mask,
>> +if more than one event occurred for the monitored filesystem obect.
> 
> s/obect/object/

Thanks Silvan. I'd forgotten to run the spell checker again.
Fixed now.

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
