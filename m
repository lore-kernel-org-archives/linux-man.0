From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: should "man feature_test_macros" mention _LARGEFILE_SOURCE?
Date: Wed, 19 Mar 2014 14:37:51 +0100
Message-ID: <53299DAF.20201@gmail.com>
References: <alpine.LFD.2.11.1403181544010.5574@localhost> <4257256.dYt9XWSnPY@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4257256.dYt9XWSnPY@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/19/2014 03:48 AM, Mike Frysinger wrote:
> On Tue 18 Mar 2014 15:46:43 Robert P. J. Day wrote:
>>   just noticed under /usr/include on my fedora rawhide system the
>> following:
>>
>> /usr/include/bits/environments.h:# define __ILP32_OFFBIG_CFLAGS	"-m32
>> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
>> /usr/include/python3.3m/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
>> /usr/include/features.h:   _LARGEFILE_SOURCE	Some more functions for 
> correct
>> standard I/O. /usr/include/features.h:#  undef _LARGEFILE_SOURCE
>> /usr/include/features.h:#  define _LARGEFILE_SOURCE	1
>> /usr/include/features.h:#ifdef _LARGEFILE_SOURCE
>> /usr/include/python2.7/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
>>
>> but there's no mention of "_LARGEFILE_SOURCE" in "man
>> feature_test_macros". is that assumed to be implied by
>> _LARGEFILE64_SOURCE? it's not clear.
> 
> nope, none of the three LFS flags imply each other, nor should they.  they're 
> related, but orthogonal by design.
> 
> i could have sworn i saw a description of them in POSIX, but i can't find it 
> now.  the GNU C library manual covers it though:
> https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html
> 
> here's a terse summary off the top of my head:
> 
> _LARGEFILE_SOURCE: expose prototypes for new funcs which POSIX got wrong 
> originally.  e.g. fseek & ftell utilize "long", so fseeko & ftello were added 
> which use "off_t".

Thanks, Mike. I'd forgotten those details.

So, as far as I can see, _LARGEFILE_SOURCE is largely of (ancient) historical
interest, so I don't think I'll bother adding it to the FTM(7) page.

Cheers,

Michael



> _LARGEFILE64_SOURCE: expose prototypes for 64-bit variant funcs w/out 
> affecting any existing funcs.  e.g. you now have fseeko64 & ftello64 which 
> take explicit off64_t types while fseeko and ftello are unchanged.  makes 
> sense when sizeof(off_t) == 4 && sizeof(off64_t) == 8.
> 
> _FILE_OFFSET_BITS: explicitly set the off_t size.  set it to 32 if you want 
> sizeof(off_t) == 4, or set it to 64 if you want sizeof(off_t) == 8.
> 
> in the ideal world, _FILE_OFFSET_BITS should default to 64 and 
> _LARGEFILE_SOURCE should default to defined.  in our crap world, apps should 
> be always building with these in their CPPFLAGS.
> -mike
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
