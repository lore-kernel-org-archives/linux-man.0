From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Thu, 20 Apr 2017 15:45:37 +0200
Message-ID: <89907506-fddb-2429-7e18-b00b8a560070@redhat.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <22f26755-f7f0-898a-ac74-3f6df92a22d7@sourceware.org>
 <c6736794-60bb-517e-0bcf-2e80331f0f72@gmail.com>
 <eb5bea0c-1f54-1b20-dc78-999160738ed3@sourceware.org>
 <2fab9588-2fa6-8c87-da25-be9376c085ea@redhat.com>
 <c31e55fb-25af-bfe9-09db-83e622ec5e3f@sourceware.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c31e55fb-25af-bfe9-09db-83e622ec5e3f-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/20/2017 03:15 PM, Siddhesh Poyarekar wrote:
> On Thursday 20 April 2017 06:31 PM, Florian Weimer wrote:
>>> Hmm interesting, I thought 'latest' would imply the last version in the
>>> sequence of versions in the map, but I guess it kinda makes sense that
>>> it is the @@ default, similar to how a static linker would pick it up.
>>
>> It might be another instance of bug 12977.  At least its fix will
>> involve preferring the default version in this case.  I don't know what
> 
>  From Michael's test case it seems like it already is preferring the
> default version.  The fix would have to be to the comment that says
> prefer the oldest version for regular unversioned lookups and the
> *latest* for the dlsym lookups.
> 
> That or I misunderstood what you said.

I think it picked the default version by accident because of the way the 
linker ordered the list.  But I could be mistaken.

>> to do if there is no default version.  We currently do not perform a
>> topological sort on the version graph to find the maximum version.
> 
> My understanding is that the VERSYM section is set up in a chained
> manner and the oldest and the newest can be derived from it.

They are chained, but the specification does not tell us whether the 
version definition records are stored in a topologically sorted order in 
the file.  We may have to re-sort them.

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
