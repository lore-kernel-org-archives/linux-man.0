From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] man.7, uri.7: Use "www.kernel.org" in example URLs
Date: Mon, 6 Feb 2017 08:08:40 +0100
Message-ID: <CAKgNAkgAe7Usfv-oEis-euhQ=kBeO4pDNqk=YdfKsxzQLNtVDQ@mail.gmail.com>
References: <20170204104956.4620-1-jwilk@jwilk.net> <20170204104956.4620-2-jwilk@jwilk.net>
 <b471be63-1271-d70d-2603-673958c1118d@gmail.com> <5895CD3A.7010905@bfs.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5895CD3A.7010905-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Walter,

On 4 February 2017 at 13:46, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 04.02.2017 12:11, schrieb Michael Kerrisk (man-pages):
>> On 02/04/2017 11:49 PM, Jakub Wilk wrote:
>>> Apparently www.kernelnotes.org is now a spam site.
>>
>> Charming!
>>
>> Thanks for the patch, Jakub. Applied.
>>
>> Cheers,
>>
>> Michael
>>
>>
>>> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
>>> ---
>>>  man7/man.7 | 2 +-
>>>  man7/uri.7 | 4 ++--
>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/man7/man.7 b/man7/man.7
>>> index ca063c3fd..aae04bfe8 100644
>>> --- a/man7/man.7
>>> +++ b/man7/man.7
>>> @@ -487,7 +487,7 @@ You can also use the new
>>>  macro to identify links to related information.
>>>  If you include URLs, use the full URL
>>>  (e.g.,
>>> -.UR http://www.kernelnotes.org
>>> +.UR http://www.kernel.org
>>>  .UE )
>>>  to ensure that tools can automatically find the URLs.
>>>  .PP
>>> diff --git a/man7/uri.7 b/man7/uri.7
>>> index 427f8ff83..39d876055 100644
>>> --- a/man7/uri.7
>>> +++ b/man7/uri.7
>>> @@ -82,7 +82,7 @@ the resource ceases to exist or becomes unavailable.
>>>  .PP
>>>  URIs are the standard way to name hypertext link destinations
>>>  for tools such as web browsers.
>>> -The string "http://www.kernelnotes.org" is a URL (and thus it
>>> +The string "http://www.kernel.org" is a URL (and thus it
>>>  is also a URI).
>>>  Many people use the term URL loosely as a synonym for URI
>>>  (though technically URLs are a subset of URIs).
>>> @@ -538,7 +538,7 @@ use the URI escaping mechanism, that is,
>>>  use the %HH encoding for unsafe octets.
>>>  .SS Writing a URI
>>>  When written, URIs should be placed inside double quotes
>>> -(e.g., "http://www.kernelnotes.org"),
>>> +(e.g., "http://www.kernel.org"),
>>>  enclosed in angle brackets (e.g., <http://lwn.net>),
>>>  or placed on a line by themselves.
>>>  A warning for those who use double-quotes:
>>>
>>
>
>
> I am not sure that is it a good idea to use real domain names here.

I think it's okay, in this case. Presumably, www.kernel.org will be
with us at least as long as the man pages, and I do not mind that a
man page gives a nod to lwn.net.

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
