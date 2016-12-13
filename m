From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Revised keyrings(7) man page for review
Date: Tue, 13 Dec 2016 14:41:35 +0100
Message-ID: <0fb87812-56f9-df39-ef74-78d30cfaaeb8@gmail.com>
References: <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com>
 <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <25262.1481628931@warthog.procyon.org.uk>
 <26757.1481635886@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <26757.1481635886@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: mtk.manpages@gmail.com, lkml <linux-kernel@vger.kernel.org>, Eugene Syromyatnikov <evgsyr@gmail.com>, keyrings@vger.kernel.org, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi David,

On 12/13/2016 02:31 PM, David Howells wrote:
> Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> wrote:
> 
>> I use/Linux man-pages uses the "Oxford comma" convention.
> 
> "... an optional comma ..." ;-)
> 
> There's also:
> 
> 	... LSM security checks are still performed, and may filter out
>         further keys that the process is not authorized to view.
> 
> but has two parts and isn't a list... ;-P

Oxford comma doesn't apply there... But, to me, it depends how
you read the text aloud. I'd read it with a pause where the comma is,
and so added a comma there.

> 
>>>>                      D   The key is dead (i.e., has been deleted).  (A
>>>>                          key  may  be  briefly  in  this  state during
>>>>                          garbage collection.)
>>>
>>> No - "dead" in this context means that the key type was unregistered.
>>
>> Okay, so the text should read as:
>>
>>                      D   The key is dead (i.e., the key has been unregis‐
>>                          tered).  (A key may be  briefly  in  this  state
>>                          during garbage collection.)
>>
>> Right?
> 
> Not quite.  The driver for the key type has been unregistered, not the key.

Bother. I meant to write "key type"! Fixed.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
