From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Thu, 10 Nov 2016 09:54:27 +0100
Message-ID: <1478768067.2642.23.camel@redhat.com>
References: <1461574090.32558.45.camel@redhat.com>
         <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
         <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-x1AKQ+9G9TiYwmWXfQlM"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b07fb334-149d-cf65-74f3-1d1951e5981b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, Carl =?ISO-8859-1?Q?Winb=E4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-x1AKQ+9G9TiYwmWXfQlM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-11-09 at 16:23 +0100, Michael Kerrisk (man-pages) wrote:
> [I'm looping a few people into this mail who previously commented
> on this page. Nikos, I will also thread you into an earlier mail 
> by Laurent Georget.]
> 
> Hello Nikos,
> 
> Sorry that I have been so slow to follow up on this.
> Thanks for your persistence. I have some comments 
> that probably require some tweaks to your patch.
> I also have some questions about a couple of other 
> earlier discussions.

The comments should be addressed now (see inline for more info or the
attached patch). I have not included my proposed fix for Laurent's
issue (my proposal was to drop that text, though it can be done
independent of this patch).

https://bugzilla.kernel.org/show_bug.cgi?id=71211




> 
> On 10/20/2016 10:37 AM, Nikos Mavrogiannopoulos wrote:
> > 
> > On Mon, 2016-08-01 at 13:48 +0200, Nikos Mavrogiannopoulos wrote:
> > > 
> > > > 
> > > > This is an updated patch reflecting the recent discussion in
> > > > linux-
> > > > crypto:
> > > > http://www.mail-archive.com/linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg204
> > > > 00.html
> > Hi,
> >  I'm resending the patch with few typo fixes, and adding Ted in CC
> > for
> > review. Ted would you like to review this patch for the random(4)
> > manpage?
> 
> Some comments below.
> 
> But one question first. You didn't further reply to George 
> Spelvin's comments on 26 April. Did you consider those comments
> irrelevant or already addressed or something else?

I believe we disagree on some points with George (see other mail).

> By the way, inline patches are rather easier for me to deal with.

(sorry for the attachment, I have no figured a way to make my mailer
send consistently the right data when inline)


> > +.\" 2016-10-20, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > +.\"     Mention that /dev/random is a legacy interface and removed
> > suggested
> > +.\"     uses of /dev/random.
> 
> No need to update this in-page changelog. We use git these days.

done

> > +.LP
> > +The \fI/dev/random\fP device is a legacy interface which dates
> > back to
> > +a time where the cryptographic primitives used in the
> > implementation
> 
> s%in the implementation%in the implementation of /dev/urandom% ?
> 

done.

> >  has no effect when opening
> >  .IR /dev/urandom .
> > @@ -82,6 +84,8 @@ for the device
> >  signals will not be handled until after the requested random bytes
> >  have been generated.
> >  
> > +
> > +
> 
> Please remove these two blank lines.

done.


> >  Since Linux 3.16,
> >  .\" commit 79a8468747c5f95ed3d5ce8376a3e82e0c5857fc
> >  a
> > @@ -104,14 +108,11 @@ This means that it will impact the contents
> >  read from both files, but it will not make reads from
> >  \fI/dev/random\fP faster.
> >  .SS Usage
> > -If you are unsure about whether you should use
> > +The 
> >  .IR /dev/random
> > -or
> > +interface is considered a legacy interface, and
> 
> I'm a little uncomfortable with the term "legacy". To me it implies 
> that there is *no* legitimate use of /dev/random these days. I'm
> no expert on randomness, but I wonder if that is true. Is it?
> If it's not, then I would prefer simply a strong statement that
> "/dev/urandom is preferred and sufficient in all use cases".

That's a tough one to handle. Yes /dev/urandom is preferred and
sufficient in all use cases, with the exception of early boot time.
More in the text. I've also added a section "KNOWN ISSUES" to state
clearly that issue, and mention getrandom() early in the page.

 
> >  If a seed file is saved across reboots as recommended below (all
> > major
> >  Linux distributions have done this since 2000 at least), the
> > output is
> > -- 2.7.4
> Laurent Georget also commented on this page in a mail last year.
> I'm going to thread you (and the other people on this mail) into
> that mail discussion in case there's something there that you
> might incorporate into a revised patch.

I think it was a different paragraph. Replied in the other email.

regards,
Nikos

--=-x1AKQ+9G9TiYwmWXfQlM
Content-Disposition: attachment;
	filename*0=0001-Update-the-random-4-documentation-towards-a-more-acc.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-Update-the-random-4-documentation-towards-a-more-acc.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA2NTI2MjFjNTYwMWQ3ODhiZDI1Y2IwNWVlNzMwZTI3Zjg1MWUzYjk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWtvcyBNYXZyb2dpYW5ub3BvdWxvcyA8bm1hdkByZWRoYXQu
Y29tPgpEYXRlOiBUaHUsIDcgQXByIDIwMTYgMDk6MDg6MTQgKzAyMDAKU3ViamVjdDogW1BBVENI
XSBVcGRhdGUgdGhlIHJhbmRvbSg0KSBkb2N1bWVudGF0aW9uIHRvd2FyZHMgYSBtb3JlIGFjY3Vy
YXRlCiB2aWV3IG9uIC9kZXYvdXJhbmRvbQoKVGhpcyBkb2N1bWVudHMgdGhlICJwcm9wZXJ0eSIg
b2YgL2Rldi91cmFuZG9tIG9mIGJlaW5nIGFibGUgdG8gc2VydmUgbnVtYmVycwpwcmlvciB0byBw
b29sIGJlaW5nIGluaXRpYWxpemVkLCBhbmQgcmVtb3ZlcyBhbnkgc3VnZ2VzdGVkIHVzYWdlcyBv
ZiAvZGV2L3JhbmRvbQp3aGljaCBhcmUgZGlzcHV0YWJsZSAoaS5lLiwgb25lLXRpbWUgcGFkKS4K
RG9jdW1lbnQgdGhlIGZhY3QgL2Rldi9yYW5kb20gaXMgYSBsZWdhY3kgaW50ZXJmYWNlIGFuZCBv
bmx5IHN1aXRhYmxlIGZvcgphcHBsaWNhdGlvbnMgd2hpY2ggY2FuIGFmZm9yZCBpbmRldGVybWlu
YXRlIGRlbGF5cyBzaW5jZSB2ZXJ5IGZldyBhcHBsaWNhdGlvbnMKY2FuIGRvIHNvLgoKU2lnbmVk
LW9mZi1ieTogTmlrb3MgTWF2cm9naWFubm9wb3Vsb3MgPG5tYXZAcmVkaGF0LmNvbT4KLS0tCiBt
YW40L3JhbmRvbS40IHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMjUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWFuNC9yYW5kb20uNCBiL21hbjQvcmFuZG9tLjQK
aW5kZXggYjY3YzQ2Zi4uODYwOWI4NCAxMDA2NDQKLS0tIGEvbWFuNC9yYW5kb20uNAorKysgYi9t
YW40L3JhbmRvbS40CkBAIC0xMyw4ICsxMyw2IEBACiAuXCIgMjAwNC0wNC0wOCwgQUVCLCBJbXBy
b3ZlZCBkZXNjcmlwdGlvbiBvZiByZWFkIGZyb20gL2Rldi91cmFuZG9tCiAuXCIgMjAwOC0wNi0y
MCwgR2VvcmdlIFNwZWx2aW4gPGxpbnV4QGhvcml6b24uY29tPiwKIC5cIiAgICAgICAgICAgICBN
YXR0IE1hY2thbGwgPG1wbUBzZWxlbmljLmNvbT4KLS5cIiAgICAgQWRkIGEgVXNhZ2Ugc3Vic2Vj
dGlvbiB0aGF0IHJlY29tbWVuZHMgbW9zdCB1c2VycyB0byB1c2UKLS5cIiAgICAgL2Rldi91cmFu
ZG9tLCBhbmQgZW1waGFzaXplcyBwYXJzaW1vbmlvdXMgdXNhZ2Ugb2YgL2Rldi9yYW5kb20uCiAu
XCIKIC5USCBSQU5ET00gNCAyMDE2LTEwLTA4ICJMaW51eCIgIkxpbnV4IFByb2dyYW1tZXIncyBN
YW51YWwiCiAuU0ggTkFNRQpAQCAtMzcsMTEgKzM1LDI2IEBAIFRoZSBnZW5lcmF0b3IgYWxzbyBr
ZWVwcyBhbiBlc3RpbWF0ZSBvZiB0aGUKIG51bWJlciBvZiBiaXRzIG9mIG5vaXNlIGluIHRoZSBl
bnRyb3B5IHBvb2wuCiBGcm9tIHRoaXMgZW50cm9weSBwb29sIHJhbmRvbSBudW1iZXJzIGFyZSBj
cmVhdGVkLgogLkxQCi1XaGVuIHJlYWQsIHRoZSBcZkkvZGV2L3JhbmRvbVxmUCBkZXZpY2Ugd2ls
bCByZXR1cm4gcmFuZG9tIGJ5dGVzCi1vbmx5IHdpdGhpbiB0aGUgZXN0aW1hdGVkIG51bWJlciBv
ZiBiaXRzIG9mIG5vaXNlIGluIHRoZSBlbnRyb3B5Ci1wb29sLgotXGZJL2Rldi9yYW5kb21cZlAg
c2hvdWxkIGJlIHN1aXRhYmxlIGZvciB1c2VzIHRoYXQgbmVlZCB2ZXJ5Ci1oaWdoIHF1YWxpdHkg
cmFuZG9tbmVzcyBzdWNoIGFzIG9uZS10aW1lIHBhZCBvciBrZXkgZ2VuZXJhdGlvbi4KK0xpbnV4
IDMuMTcgYW5kIGxhdGVyIHByb3ZpZGVzIHRoZSBzaW1wbGVyIGFuZCBzYWZlciAoc2VlIGJlbG93
KQorLkJSIGdldHJhbmRvbSgyKQoraW50ZXJmYWNlIHdoaWNoIHJlcXVpcmVzIG5vIHNwZWNpYWwg
ZmlsZXMuCisuTFAKK1doZW4gcmVhZCwgdGhlIFxmSS9kZXYvdXJhbmRvbVxmUCBkZXZpY2UgcmV0
dXJuIHJhbmRvbSBieXRlcyB1c2luZyBhIHBzZXVkb3JhbmRvbQorbnVtYmVyIGdlbmVyYXRvciBz
ZWVkZWQgZnJvbSB0aGUgZW50cm9weSBwb29sLiBUaGF0IG9wZXJhdGlvbiBpcworbm9uLWJsb2Nr
aW5nLiBXaGVuIHVzZWQgZHVyaW5nIGVhcmx5IGJvb3QgdGltZSwgdGhpcyBkZXZpY2UgbWF5IHJl
dHVybgorZGF0YSBwcmlvciB0byB0aGUgZW50cm9weSBwb29sIGJlaW5nIGluaXRpYWxpemVkLgor
SWYgdGhpcyBpcyBvZiBjb25jZXJuIGluIHlvdXIgYXBwbGljYXRpb24sIHVzZQorLkJSIGdldHJh
bmRvbSgyKQorb3IgXGZJL2Rldi9yYW5kb21cZlAgaW5zdGVhZC4KKworLkxQCitUaGUgXGZJL2Rl
di9yYW5kb21cZlAgZGV2aWNlIGlzIGEgbGVnYWN5IGludGVyZmFjZSB3aGljaCBkYXRlcyBiYWNr
IHRvCithIHRpbWUgd2hlcmUgdGhlIGNyeXB0b2dyYXBoaWMgcHJpbWl0aXZlcyB1c2VkIGluIHRo
ZSBpbXBsZW1lbnRhdGlvbgorb2YgXGZJL2Rldi91cmFuZG9tXGZQIHdlcmUgbm90IHdpZGVseSB0
cnVzdGVkLiBJdCB3aWxsIHJldHVybiByYW5kb20gYnl0ZXMKK29ubHkgd2l0aGluIHRoZSBlc3Rp
bWF0ZWQgbnVtYmVyIG9mIGJpdHMgb2YgZnJlc2ggbm9pc2UgaW4gdGhlIGVudHJvcHkKK3Bvb2ws
IGJsb2NraW5nIGlmIG5lY2Vzc2FyeS4KK1xmSS9kZXYvcmFuZG9tXGZQIGlzIHN1aXRhYmxlIGZv
ciBhcHBsaWNhdGlvbnMgdGhhdCBuZWVkIHZlcnkKK2hpZ2ggcXVhbGl0eSByYW5kb21uZXNzLCBh
bmQgY2FuIGFmZm9yZCBpbmRldGVybWluYXRlIGRlbGF5cy4KIFdoZW4gdGhlIGVudHJvcHkgcG9v
bCBpcyBlbXB0eSwgcmVhZHMgZnJvbSBcZkkvZGV2L3JhbmRvbVxmUCB3aWxsIGJsb2NrCiB1bnRp
bCBhZGRpdGlvbmFsIGVudmlyb25tZW50YWwgbm9pc2UgaXMgZ2F0aGVyZWQuCiBJZgpAQCAtNjAs
MTggKzczLDggQEAgd2lsbCByZXR1cm4gLTEgYW5kCiAuSSBlcnJubwogd2lsbCBiZSBzZXQgdG8K
IC5CUiBFQUdBSU4gLgotLkxQCi1BIHJlYWQgZnJvbSB0aGUgXGZJL2Rldi91cmFuZG9tXGZQIGRl
dmljZSB3aWxsIG5vdCBibG9jawotd2FpdGluZyBmb3IgbW9yZSBlbnRyb3B5LgotSWYgdGhlcmUg
aXMgbm90IHN1ZmZpY2llbnQgZW50cm9weSwgYSBwc2V1ZG9yYW5kb20gbnVtYmVyIGdlbmVyYXRv
ciBpcyB1c2VkCi10byBjcmVhdGUgdGhlIHJlcXVlc3RlZCBieXRlcy4KLUFzIGEgcmVzdWx0LCBp
biB0aGlzIGNhc2UgdGhlIHJldHVybmVkIHZhbHVlcyBhcmUgdGhlb3JldGljYWxseSB2dWxuZXJh
YmxlIHRvIGEKLWNyeXB0b2dyYXBoaWMgYXR0YWNrIG9uIHRoZSBhbGdvcml0aG1zIHVzZWQgYnkg
dGhlIGRyaXZlci4KLUtub3dsZWRnZSBvZiBob3cgdG8gZG8gdGhpcyBpcyBub3QgYXZhaWxhYmxl
IGluIHRoZSBjdXJyZW50IHVuY2xhc3NpZmllZAotbGl0ZXJhdHVyZSwgYnV0IGl0IGlzIHRoZW9y
ZXRpY2FsbHkgcG9zc2libGUgdGhhdCBzdWNoIGFuIGF0dGFjayBtYXkKLWV4aXN0LgotSWYgdGhp
cyBpcyBhIGNvbmNlcm4gaW4geW91ciBhcHBsaWNhdGlvbiwgdXNlIFxmSS9kZXYvcmFuZG9tXGZQ
Ci1pbnN0ZWFkLgorCitUaGUgZmxhZwogLkIgT19OT05CTE9DSwogaGFzIG5vIGVmZmVjdCB3aGVu
IG9wZW5pbmcKIC5JUiAvZGV2L3VyYW5kb20gLgpAQCAtMTA0LDE0ICsxMDcsMTUgQEAgVGhpcyBt
ZWFucyB0aGF0IGl0IHdpbGwgaW1wYWN0IHRoZSBjb250ZW50cwogcmVhZCBmcm9tIGJvdGggZmls
ZXMsIGJ1dCBpdCB3aWxsIG5vdCBtYWtlIHJlYWRzIGZyb20KIFxmSS9kZXYvcmFuZG9tXGZQIGZh
c3Rlci4KIC5TUyBVc2FnZQotSWYgeW91IGFyZSB1bnN1cmUgYWJvdXQgd2hldGhlciB5b3Ugc2hv
dWxkIHVzZQorVGhlCiAuSVIgL2Rldi9yYW5kb20KLW9yCitpbnRlcmZhY2UgaXMgY29uc2lkZXJl
ZCBhIGxlZ2FjeSBpbnRlcmZhY2UsIGFuZAogLklSIC9kZXYvdXJhbmRvbSAsCi10aGVuIHByb2Jh
Ymx5IHlvdSB3YW50IHRvIHVzZSB0aGUgbGF0dGVyLgotQXMgYSBnZW5lcmFsIHJ1bGUsCi0uSVIg
L2Rldi91cmFuZG9tCi1zaG91bGQgYmUgdXNlZCBmb3IgZXZlcnl0aGluZyBleGNlcHQgbG9uZy1s
aXZlZCBHUEcvU1NML1NTSCBrZXlzLgoraXMgcHJlZmVycmVkIGFuZCBzdWZmaWNpZW50IGluIGFs
bCB1c2UgY2FzZXMsIHdpdGggdGhlIGV4Y2VwdGlvbiBvZgorYXBwbGljYXRpb25zIHdoaWNoIHJl
cXVpcmUgcmFuZG9tbmVzcyBkdXJpbmcgZWFybHkgYm9vdCB0aW1lOyBmb3IKK3RoZXNlIGFwcGxp
Y2F0aW9ucywgdGhlIHN5c3RlbSBjYWxsCisuQlIgZ2V0cmFuZG9tKDIpCittdXN0IGJlIHVzZWQg
aW5zdGVhZCwgYmVjYXVzZSB3aWxsIGJsb2NrIHVudGlsIHRoZSBlbnRyb3B5IHBvb2wgaXMgaW5p
dGlhbGl6ZWQuCiAKIElmIGEgc2VlZCBmaWxlIGlzIHNhdmVkIGFjcm9zcyByZWJvb3RzIGFzIHJl
Y29tbWVuZGVkIGJlbG93IChhbGwgbWFqb3IKIExpbnV4IGRpc3RyaWJ1dGlvbnMgaGF2ZSBkb25l
IHRoaXMgc2luY2UgMjAwMCBhdCBsZWFzdCksIHRoZSBvdXRwdXQgaXMKQEAgLTMxOSw2ICszMjMs
OSBAQCB3aGljaCBnZXRzIGFkZGVkIHRvIHRoZSBlbnRyb3B5IHBvb2wuCiAuQlIgUk5EWkFQRU5U
Q05UICIsICIgUk5EQ0xFQVJQT09MCiBaZXJvIHRoZSBlbnRyb3B5IGNvdW50IG9mIGFsbCBwb29s
cyBhbmQgYWRkIHNvbWUgc3lzdGVtIGRhdGEgKHN1Y2ggYXMKIHdhbGwgY2xvY2spIHRvIHRoZSBw
b29scy4KKy5TSCBLTk9XTiBJU1NVRVMKK1doZW4gdXNlZCBkdXJpbmcgZWFybHkgYm9vdCwgXGZJ
L2Rldi91cmFuZG9tXGZQIG1heSByZXR1cm4gZGF0YSBwcmlvciB0byB0aGUgZW50cm9weSBwb29s
IGJlaW5nIGluaXRpYWxpemVkLgorCiAuU0ggRklMRVMKIC9kZXYvcmFuZG9tCiAuYnIKLS0gCjIu
Ny40Cgo=


--=-x1AKQ+9G9TiYwmWXfQlM--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
