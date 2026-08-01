Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DAB2F361B
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785623144; cv=pass; b=XbOldXGkLmYaa38T3EFszlIP39NtuA4p3rzXvj26rBHlRZ+l+Sr8MNu8uR6gbmj2x1z2cuPzcQOXah7aBfL7lL118XwZ+oBU+W+hyShZ60ZQlvCGxSYftmSRgMmhegiTdXP8I9VaLL8qQ5jouJ/A7mbItYyCD+LQ3wCIsHfMT8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785623144; c=relaxed/simple;
	bh=tNQx6Vx7+mQ9NWYOvJ0vMEjFf96MJ9xhEO2dY1RNOpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQO1QCYODo89awBjVya5JbXY6Zjo6ntl7G79YBu6XfuEy9j3wne8tRpLmM3doRzfVUeYR2QF+euxpbEDFE0qcZpbR6m0y6bUMh0r6Vf1dxm+XaNLUNqHGjQveeyByy2KpHP38VqBmUOUrx5JVG9tQgdoSJtn7Q1uAr2fdHamwFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org; spf=pass smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=I8GFuhdj; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=657fPrCg; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="I8GFuhdj";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="657fPrCg"
ARC-Seal: i=1; a=rsa-sha256; t=1785622956; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eSxNTeoploA0yw0cbYt/kOwknGlso9tO1A1i6WbfcqQGoxlErM8IPgzUm4zHHW1zur
    fBvOU/qmLVFpm0NonqOprEyf76dlWCMzUCFWtjZG511sPAymfGQJcOUsnEQk7Ive0iHH
    fiiaWMIG7Z1mMQrQCX0yoQfwJBc7hnrOGdN62Z1bNraDWdR3RVK+MNrGviuK8wl4QDKa
    J+rav7srZkF+2mjJ08LN3d7Th/AXs6NpNEHayy/6u+seeGtRGToBpT7hTS9aO2Y6Jxjv
    YBlCmY7ruxZMKTkfM2lKddOkkZyuslPYhU1WHXw4Q7i5kbsR7amyPDgaTg2Kz59UQrHQ
    psYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1785622956;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=x7yTkWOE+7nicxusedW9KIu4IJ1elLGfwvGUt601Avg=;
    b=ocQ3QStJeM3mOjiCTxPhC9nTqRusLRIEUvAZU7NKDDNowzNu00xTLZ7+RXrS0hMIx2
    yjMrRN2tIkU11bRutrB730c5BXZGPvwG8bbEeY73ancNDKVcViSY/SR5RTmOmdfPLZd5
    dN07XM2cGYingcC7xA/yV1Z6e2TnvpY0CVv2V7DOE3bSNpnPf/nzrBCoHOEHJoGlaNOK
    TtWLvr/ZlqSnxTefa7KF2J8AVXuOBdXblxt7yGN4IgmzFia4Zw73OeH1c3rCP2j1U53H
    a4K+LyhT2oUx2vfPAytWQy2a4xhnRlvTIUYfE8nfmQG2Rn4pEVVYxKqsLicAIlaoylMk
    KHnQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1785622956;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=x7yTkWOE+7nicxusedW9KIu4IJ1elLGfwvGUt601Avg=;
    b=I8GFuhdjneS5oqy5jd5aHGyRY61fy8M0Q/4xIY+e+Jg29Ud09L9tvGavP4kCl/wXaI
    kHxlDn2iBuwMKgJi9y9jrq1H81aSvcflbtsxlkQpSUONN/Kv/U7J8mty5dAAIU65W48s
    N9iZwJVEJBO2t5r8ZUeFjsmmlF6hwrQfGUpd2W2Dwg5KMGnHq1OI33603Vgd+RY/RKTb
    j3rt8Btxf3czc7s0RzV1oxhYZDnTDbaTc5YN/4wJDipJntluv1f80MaXAYcdLaPW7Z9E
    ZABgRMbsLo3SZDZjeMkeFE3F9vd1ybPV2BvPpiE9mFFB12rDfvzOfrxdFMMwzo/CPQ0h
    dZ2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1785622956;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=x7yTkWOE+7nicxusedW9KIu4IJ1elLGfwvGUt601Avg=;
    b=657fPrCgQaEjIDEFmeBem7Ba9YZBhXCOFHwFskymWrAbBcvsz1/eGzkyHhuTYMG4+j
    To20dG9DRNCIXX85ETCg==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUABIYZgv6aLDTL6Xu4hNwOa7LgT5qxJwPHjvVHn41xUN2XO6ElUUX"
Received: from cagnes.localnet
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id N4429c271MMZkHz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 2 Aug 2026 00:22:35 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: linux-man@vger.kernel.org, Alejandro Colomar <alx@kernel.org>
Cc: Sam James <sam@gentoo.org>,
 "G. Branden Robinson" <g.branden.robinson@gmail.com>,
 Joseph Myers <josmyers@redhat.com>, Keith Bostic <keith@bostic.com>,
 Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>,
 Collin Funk <collin.funk1@gmail.com>,
 JeanHeyd Meneide <phdofthehouse@gmail.com>,
 Christopher Bazley <chris.bazley.wg14@gmail.com>,
 Serge Hallyn <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>,
 Evgeny Grin <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>,
 bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject:
 Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard mem*()
 functions as provided by <memory.h>
Date: Sun, 02 Aug 2026 00:22:34 +0200
Message-ID: <3556566.BddDVKsqQX@cagnes>
In-Reply-To:
 <c5bad3a80de2feaf3838cb302eeaea1dcc4ba672.1785543779.git.alx@kernel.org>
References:
 <cover.1785532392.git.alx@kernel.org>
 <c5bad3a80de2feaf3838cb302eeaea1dcc4ba672.1785543779.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Alejandro,

All proposed ISO C changes need to be evaluated according to (at least)
these three dimensions:

  * Benefit (for the community of C programmers),
  * Cost of adoption (for the community of C programmers),
  * Consistency.

Your previous proposal "alx-0097r1 - <memory.h>, the legitimate header for
memcpy(3) et al." evaluates like this, IMO:
  * Benefit: Small.
  * Cost of adoption: Huge
    (there are more than 700000 references to memcpy() alone in Debian sour=
ces
    [1]).
  * Consistency: Reasonable (you have explained why strncpy is actually a "=
mem"
    function).

This proposal [v2] is no longer for ISO C, but =E2=80=94 if you want to tea=
ch the
community something by modifying the man pages =E2=80=94 needs to be evalua=
ted according
to the same criteria.
  * Benefit: None.
  * Cost of adoption: Moderate
    (because these 5 functions are not frequently used).
  * Consistency: Totally negative.
      - memmem() is a generalization of memchr(), therefore it belongs in t=
he
        same header file, namely <string.h>.
      - memrchr() is an analogue to memchr(), therefore likewise it belongs=
 in
        <string.h>.
      - mempcpy() is a variant of memcpy(), therefore likewise it belongs in
        <string.h>.
      - strndupa() is a variant of strndup() which is declared in <string.h=
>,
        therefore it belongs in <string.h> as well.

Please do us the favour to evaluate your proposals according to these
dimensions by yourself, before spreading them.

And, of course, for man page changes, consider the authoritative source.
=46or example, memfrob() exists only in glibc [2], therefore its authoritat=
ive
documentation is in the glibc manual [3], and it says "It is declared in
string.h." The man pages MUST say the same thing.

Thanks.

      Bruno

[1] https://codesearch.debian.net/search?q=3D%5Cbmemcpy%5Cb&literal=3D0
[2] https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dgnulib/maint-tools.git;=
a=3Dtree;f=3Dplatforms/various-symlists
[3] https://sourceware.org/glibc/manual/2.44/html_node/Obfuscating-Data.html



