Received: from mail-server.nl (mail-server.nl [83.137.145.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30643DA7D4
	for <linux-man@vger.kernel.org>; Sat, 17 Oct 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.137.145.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792265113; cv=none; b=plhavsUyrnxMgy6tr+OlAULOkDSanWpki6lIBjMBVtR5WfJf8cWP36fpAi7TYQxZjKvQHYODD9DlBhwXMERlMneW9z50E5f0Pd4KJUiBvGh8BYqgTnEuzjxRCdpNiBl4MHL7YdpLGeKY40IlobVfOAThUyL18S0HD8X7i1IKU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792265113; c=relaxed/simple;
	bh=bNxm9T0Pp4qpYpFHE5XkmBWbOb8sDqfW921HHun0Otw=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=KkKWE/chQaZ/Vcb07SrBFhHsNgSt0YPAd1exoQndAPsOLkwD3mEMdO1u2ovZatBRjVyeL6WgSyaneWNaRJv2POHqfYVjMrkEj505B++ixHFgrEO9ftSt+5Bg7sbiH0/OspYcm/PxJ7nADDgZp0BGP3AtRum148VM1E7e9GMdvgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buddelmeijer.nl; spf=pass smtp.mailfrom=buddelmeijer.nl; dkim=pass (1024-bit key) header.d=buddelmeijer.nl header.i=@buddelmeijer.nl header.b=XjRmQ1yZ; arc=none smtp.client-ip=83.137.145.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buddelmeijer.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buddelmeijer.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=buddelmeijer.nl header.i=@buddelmeijer.nl header.b="XjRmQ1yZ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buddelmeijer.nl;
	s=sslmailserver; t=1792264763;
	bh=bNxm9T0Pp4qpYpFHE5XkmBWbOb8sDqfW921HHun0Otw=;
	h=Date:To:Cc:From:Subject:From;
	b=XjRmQ1yZFAOxDj8/JEEwCNZbmnvPHNG8+7qi+n/HiM5j6hPrl5PrmPo2Sk4ZsD8r4
	 CvhhqeLtaqXP2svMX3Qavn18dlod2OG3ZKQNmxWQmqrvABmLfgwnAmSaHZt8727LiL
	 yo216J8saZr9t5K5g5xzbsbjoxGfH6gEN+cPpbCI=
Received: from [IPV6:2a10:3781:3611:1:1ac5:991:78ba:230d] (unknown [IPv6:2a10:3781:3611:1:1ac5:991:78ba:230d])
	by mail-server.nl (Postfix) with ESMTPSA id A922E1BC;
	Sat, 17 Oct 2026 21:19:23 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------WfJUuWa83nmXusvzE10vjCrU"
Message-ID: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>
Date: Sat, 17 Oct 2026 21:19:22 +0200
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Icedove Daily
Content-Language: en-US, nl
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
From: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
Subject: `make -R check` fails due to futex_waitv.2 and console_codes.4 being
 too wide

This is a multi-part message in MIME format.
--------------WfJUuWa83nmXusvzE10vjCrU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

Running `make -R check` fails because the text in futex_waitv.2 and 
console_codes.4 is too wide.

I noticed this when trying to enable the test phase when updating the 
man-pages package in Guix; see https://codeberg.org/guix/guix/pulls/11893

That Guix pull request contains a patch to fix the man-pages so `make 
check` passes; said patch is attached.

Maybe you could device a better patch though, in particular for 
console_codes.  The affected table is much narrower than similar tables, 
so some lines that have to be truncated, would easily fit in one of the 
other tables.  But I couldn't easily figure out what determines the 
column widths, so I didn't fix that.

Also, the Changelog for 6.04 contains some instructions to touch certain 
files to ensure the test suite passes.  I did not attempt to use that 
workaround.

Thanks for maintaining these man pages, they contain such a wealth of 
information.  No need to credit me in case you fix these minor things.

Hugo

--------------WfJUuWa83nmXusvzE10vjCrU
Content-Type: text/x-patch; charset=UTF-8;
 name="man-pages-fix-make-check.patch"
Content-Disposition: attachment; filename="man-pages-fix-make-check.patch"
Content-Transfer-Encoding: base64

RnJvbSAxMzQ1ODc1ZDE0Yjk1MGU2ZTY0YjhmZDlhOGYzMzVlZmU3Y2U1YWUwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIdWdvIEJ1ZGRlbG1laWplciA8aHVnb0BidWRkZWxt
ZWlqZXIubmw+CkRhdGU6IFNhdCwgMTcgT2N0IDIwMjYgMTA6NDc6MDMgKzAyMDAKU3ViamVj
dDogW1BBVENIXSBtYW4vbWFuMi9mdXRleF93YWl0di4yOiBGaXggYG1ha2UgY2hlY2tgLgog
bWFuL21hbjQvY29uc29sZV9jb2Rlcy40OiBGaXggYG1ha2UgY2hlY2tgLgoKLS0tCiBtYW4v
bWFuMi9mdXRleF93YWl0di4yICAgfCAgMyArKy0KIG1hbi9tYW40L2NvbnNvbGVfY29kZXMu
NCB8IDIwICsrKysrKysrKysrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWFuL21hbjIvZnV0ZXhf
d2FpdHYuMiBiL21hbi9tYW4yL2Z1dGV4X3dhaXR2LjIKaW5kZXggNDE1OGYyOTdkLi5hY2Fm
ZDI4MjkgMTAwNjQ0Ci0tLSBhL21hbi9tYW4yL2Z1dGV4X3dhaXR2LjIKKysrIGIvbWFuL21h
bjIvZnV0ZXhfd2FpdHYuMgpAQCAtMzg1LDcgKzM4NSw4IEBAIG1haW4odm9pZCkKIAkJY2xv
Y2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZ0aW1lb3V0KTsKIAkJdGltZW91dC50dl9z
ZWMgKz0gMTsKIFwmCi0JCXdva2UgPSBteV9mdXRleF93YWl0dih3YWl0ZXJzLCBjb3VudG9m
KGZ1dGV4ZXMpLCAwLCAmdGltZW91dCwgQ0xPQ0tfTU9OT1RPTklDKTsKKwkJd29rZSA9IG15
X2Z1dGV4X3dhaXR2KHdhaXRlcnMsIGNvdW50b2YoZnV0ZXhlcyksIDAsCisJCSAgICAgICAg
ICAgICAgICAgICAgICAmdGltZW91dCwgQ0xPQ0tfTU9OT1RPTklDKTsKIAkJaWYgKHdva2Ug
PT0gXC0xICYmIChlcnJubyAhPSBFQUdBSU4gJiYgZXJybm8gIT0gRVdPVUxEQkxPQ0spKQog
CQkJZXJyKEVYSVRfRkFJTFVSRSwgIm15X2Z1dGV4X3dhaXR2Iik7CiBcJgpkaWZmIC0tZ2l0
IGEvbWFuL21hbjQvY29uc29sZV9jb2Rlcy40IGIvbWFuL21hbjQvY29uc29sZV9jb2Rlcy40
CmluZGV4IGZhZjEyYTY2Yy4uOGNlMTgyZmFkIDEwMDY0NAotLS0gYS9tYW4vbWFuNC9jb25z
b2xlX2NvZGVzLjQKKysrIGIvbWFuL21hbjQvY29uc29sZV9jb2Rlcy40CkBAIC03NTUsMTMg
Kzc1NSwyMyBAQCBFU0MgXSAxIDsgXGZbSV10eHRcZltdIFNUCVNldCBpY29uIG5hbWUgdG8g
XGZbSV10eHRcZltdLgogRVNDIF0gMiA7IFxmW0lddHh0XGZbXSBTVAlTZXQgd2luZG93IHRp
dGxlIHRvIFxmW0lddHh0XGZbXS4KIEVTQyBdIDQgOyBcZltJXW51bVxmW10gOyBcZltJXXR4
dFxmW10gU1QJU2V0IGNvbG9yIFxmW0ldbnVtXGZbXSAoMC0yNTUpIHRvIFxmW0lddHh0XGZb
XS4KIEVTQyBdIDUgOyAwIDsgXGZbSV10eHRcZltdIFNUCVNldCB0aGUgY29sb3IgZm9yIGJv
bGQgc3Vic3RpdHV0aW9uIHRvIFxmW0lddHh0XGZbXS4KLUVTQyBdIDUgOyAxIDsgXGZbSV10
eHRcZltdIFNUCVNldCB0aGUgY29sb3IgZm9yIHVuZGVybGluZSBzdWJzdGl0dXRpb24gdG8g
XGZbSV10eHRcZltdLgotRVNDIF0gNSA7IDIgOyBcZltJXXR4dFxmW10gU1QJU2V0IHRoZSBj
b2xvciBmb3IgYmxpbmtpbmcgc3Vic3RpdHV0aW9uIHRvIFxmW0lddHh0XGZbXS4KK0VTQyBd
IDUgOyAxIDsgXGZbSV10eHRcZltdIFNUCVR7CitTZXQgdGhlIGNvbG9yIGZvciB1bmRlcmxp
bmUgc3Vic3RpdHV0aW9uIHRvIFxmW0lddHh0XGZbXS4KK1R9CitFU0MgXSA1IDsgMiA7IFxm
W0lddHh0XGZbXSBTVAlUeworU2V0IHRoZSBjb2xvciBmb3IgYmxpbmtpbmcgc3Vic3RpdHV0
aW9uIHRvIFxmW0lddHh0XGZbXS4KK1R9CiBFU0MgXSA1IDsgMyA7IFxmW0lddHh0XGZbXSBT
VAlTZXQgdGhlIGNvbG9yIGZvciByZXZlcnNlIHN1YnN0aXR1dGlvbiB0byBcZltJXXR4dFxm
W10uCiBFU0MgXSA1IDsgNCA7IFxmW0lddHh0XGZbXSBTVAlTZXQgdGhlIGNvbG9yIGZvciBp
dGFsaWMgc3Vic3RpdHV0aW9uIHRvIFxmW0lddHh0XGZbXS4KLUVTQyBdIDYgOyAwIDsgXGZb
SV12YWxcZltdIFNUCVRvZ2dsZSBib2xkIHJlbmRpdGlvbjogMD1ib2xkLCAxPXN1YnN0aXR1
dGUgYnkgY29sb3IuCi1FU0MgXSA2IDsgMSA7IFxmW0lddmFsXGZbXSBTVAlUb2dnbGUgdW5k
ZXJzY29yZSByZW5kaXRpb246IDA9dW5kZXJzY29yZSwgMT1jb2xvci4KLUVTQyBdIDYgOyAy
IDsgXGZbSV12YWxcZltdIFNUCVRvZ2dsZSBibGlua2luZyByZW5kaXRpb246IDA9Ymxpbmtp
bmcsIDE9Y29sb3IuCitFU0MgXSA2IDsgMCA7IFxmW0lddmFsXGZbXSBTVAlUeworVG9nZ2xl
IGJvbGQgcmVuZGl0aW9uOiAwPWJvbGQsIDE9c3Vic3RpdHV0ZSBieSBjb2xvci4KK1R9CitF
U0MgXSA2IDsgMSA7IFxmW0lddmFsXGZbXSBTVAlUeworVG9nZ2xlIHVuZGVyc2NvcmUgcmVu
ZGl0aW9uOiAwPXVuZGVyc2NvcmUsIDE9Y29sb3IuCitUfQorRVNDIF0gNiA7IDIgOyBcZltJ
XXZhbFxmW10gU1QJVHsKK1RvZ2dsZSBibGlua2luZyByZW5kaXRpb246IDA9Ymxpbmtpbmcs
IDE9Y29sb3IuCitUfQogRVNDIF0gNiA7IDMgOyBcZltJXXZhbFxmW10gU1QJVG9nZ2xlIHJl
dmVyc2UgcmVuZGl0aW9uOiAwPXJldmVyc2UsIDE9Y29sb3IuCiBFU0MgXSA2IDsgNCA7IFxm
W0lddmFsXGZbXSBTVAlUb2dnbGUgaXRhbGljIHJlbmRpdGlvbjogMD1pdGFsaWMsIDE9Y29s
b3IuCiBFU0MgXSAxMCA7IFxmW0lddHh0XGZbXSBTVAlTZXQgdGhlIGZvcmVncm91bmQgdGV4
dCBjb2xvciB0byBcZltJXXR4dFxmW10uCi0tIAoyLjU0LjAKCg==

--------------WfJUuWa83nmXusvzE10vjCrU--
