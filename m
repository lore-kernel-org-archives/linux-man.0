From: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Add Prefer_MAP_32BIT_EXEC to map executable pages with MAP_32BIT
Date: Tue, 15 Dec 2015 13:34:32 -0800
Message-ID: <CAMe9rOo1OBOGruWMoLTx96wnkKUYPzBZ5HcOCFdGJEp+jTRzVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=089e0116060031df540526f68eb3
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Jeff Law <law-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Adhemerval Zanella <adhemerval.zanella-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--089e0116060031df540526f68eb3
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 1:06 PM, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 12/15/2015 03:08 PM, H.J. Lu wrote:
>> On Tue, Dec 15, 2015 at 10:38 AM, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>> > On 12/15/2015 01:27 PM, Carlos O'Donell wrote:
>>>> >> +  cpu_features->feature[index_Prefer_MAP_32BIT_EXEC]
>>>> >> +    |= get_prefer_map_32bit_exec ();
>>>> >>
>>>> >> You wouldn't need get_prefer_map_32bit_exec, since this is all part of
>>>> >> the code, like dl-librecon.h, which parses the extra env var.
>>> >
>>> > To be clear:
>>> >
>>> > * Add new bit flag definitions for cpu_features.
>>> > * Add a sysdeps/unix/sysv/linux/x86_64/dl-silvermont.h
>>> >   * Fill in EXTRA_LD_ENVVARS or add new ones.
>>> >   * Write to rtld's GLRO cpu_features the bit you need based
>>> >     on __libc_enable_secure.
>>> >
>>> > That should simplify and concentrate the Silvermont fixes to
>>> > just two files, making future maintenance and documentation
>>> > easier.
>>> >
>>> >
>> This is the updated patch.  I put EXTRA_LD_ENVVARS and
>> EXTRA_UNSECURE_ENVVARS in x86_64/64/dl-librecon.h
>> to be consistent with i386/dl-librecon.h.  If we ever need to
>> update EXTRA_LD_ENVVARS/EXTRA_UNSECURE_ENVVARS
>> in the future, we have a single file to change.
>>
>> Tested on x86-64.  OK for master?
>>
>> Thanks for all the feedbacks and suggestions.
>
> This looks much better and much cleaner. Looks good to me now. It also
> appears you have consesnsus with this last change.
>
> It needs a bug # please since you're fixing a user-visible performance
> problem on Silvermont.

I opened

https://sourceware.org/bugzilla/show_bug.cgi?id=19367

and checked in my patch.

> It appears to meet Zack's requirement to choose a security safe default
> at the expense of performance (I agree with that).
>
> I *strongly* urge you to immediately submit a patch to the linux man
> pages project to document that as of 2.23 this new flag exists and
> does what you describe it does.
>

Here is a patch for Linux man page.

Thanks.


H.J.

--089e0116060031df540526f68eb3
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-Document-LD_PREFER_MAP_32BIT_EXEC-for-ld.so-8.patch"
Content-Disposition: attachment;
	filename="0001-Document-LD_PREFER_MAP_32BIT_EXEC-for-ld.so-8.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ii7wpos00

RnJvbSA2YjgwOTVmYjJlMTIzOTE1ZWMyZTU4Njc1M2QzZDdmZjdmMTRhZWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiSC5KLiBMdSIgPGhqbC50b29sc0BnbWFpbC5jb20+CkRhdGU6
IFR1ZSwgMTUgRGVjIDIwMTUgMTM6Mjk6MzcgLTA4MDAKU3ViamVjdDogW1BBVENIXSBEb2N1bWVu
dCBMRF9QUkVGRVJfTUFQXzMyQklUX0VYRUMgZm9yIGxkLnNvICg4KQoKR2xpYmMgMi4yMyBhZGRl
ZCBMRF9QUkVGRVJfTUFQXzMyQklUX0VYRUMgdG8gaW1wcm92ZSBicmFuY2ggcHJlZGljdGlvbgpw
ZXJmb3JtYW5jZSBvbiBTaWx2ZXJtb250LgoKU2lnbmVkLW9mZi1ieTogSC5KLiBMdSA8aGpsLnRv
b2xzQGdtYWlsLmNvbT4KLS0tCiBtYW44L2xkLnNvLjggfCAxMCArKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21hbjgvbGQuc28uOCBiL21h
bjgvbGQuc28uOAppbmRleCA2MDhjZjdjLi5kYTMzNDA0IDEwMDY0NAotLS0gYS9tYW44L2xkLnNv
LjgKKysrIGIvbWFuOC9sZC5zby44CkBAIC00NzIsNiArNDcyLDE2IEBAIGVudmlyb25tZW50IHZh
cmlhYmxlIGhhcyBiZWVuIHNldC4KIChFTEYgb25seSkoZ2xpYmMgc2luY2UgMi4xLjMpCiBJZiBz
ZXQgdG8gYSBub25lbXB0eSBzdHJpbmcsIHdhcm4gYWJvdXQgdW5yZXNvbHZlZCBzeW1ib2xzLgog
LlRQCisuQiBMRF9QUkVGRVJfTUFQXzMyQklUX0VYRUMKKyh4ODYtNjQgb25seSkoZ2xpYmMgc2lu
Y2UgMi4yMykKK0FjY29yZGluZyB0byBTaWx2ZXJtb250IHNvZnR3YXJlIG9wdGltaXphdGlvbiBn
dWlkZSwgZm9yIDY0LWJpdAorYXBwbGljYXRpb25zLCBicmFuY2ggcHJlZGljdGlvbiBwZXJmb3Jt
YW5jZSBjYW4gYmUgbmVnYXRpdmVseSBpbXBhY3RlZAord2hlbiB0aGUgdGFyZ2V0IG9mIGEgYnJh
bmNoIGlzIG1vcmUgdGhhbiA0R0IgYXdheSBmcm9tIHRoZSBicmFuY2guCitJZiBzZXQsIGxkLnNv
IHdpbGwgdHJ5IHRvIG1hcCBleGVjdXRhYmxlIHBhZ2VzIHdpdGggTUFQXzMyQklUIGZpcnN0Lgor
TkI6IE1BUF8zMkJJVCB3aWxsIG1hcCB0byBsb3dlciAyR0IsIG5vdCBsb3dlciA0R0IsIGFkZHJl
c3MuICBTaW5jZQorTUFQXzMyQklUIHJlZHVjZXMgYml0cyBhdmFpbGFibGUgZm9yIGFkZHJlc3Mg
c3BhY2UgbGF5b3V0IHJhbmRvbWl6YXRpb24KKyhBU0xSKSwgTERfUFJFRkVSX01BUF8zMkJJVF9F
WEVDIGlzIGFsd2F5cyBkaXNhYmxlZCBmb3IgU1VJRCBwcm9ncmFtcy4KKy5UUAogLkIgTEREX0FS
R1YwCiAobGliYzUpCiAuSVIgYXJndiBbMF0KLS0gCjIuNS4wCgo=
--089e0116060031df540526f68eb3--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
