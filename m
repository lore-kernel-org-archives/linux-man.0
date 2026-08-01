Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759692EBBB7
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785626393; cv=pass; b=dAhOS+9NAAOu2kZfYBGix34wnzmrVNb3DzP8gL+lvPQPi0OlZ/1FrJMFakqzViJrS7nypCs3xOnvmKLVZBAtU7dhnzGbA4E3F15Ey9+yYNxzXi9voj3CvAULCCDqgr8HZ+VOS40vtz1lmgWWMGPs+tRQAbJbV1KX1/T4jsDIZNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785626393; c=relaxed/simple;
	bh=1VfEdWhCkWCuAHmvTcgU9GOz8biHBzEHdf1VASJpmtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdYON/LKeaAK6NGtSrGsq7M88fYAAETNGueQ9rwYf36067BtQZdBpXWsXb8IYyZjkHzvOPp26tK/QANDJ+B8dS0aQ0PlsYxsw+DhqTY4XFGgquL5Mhc6Jgrav+tRi/V1CfzM+XiYLZZO4fGX2SIyuDDpwN3+tMttkXU9L9twdFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org; spf=pass smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=EFeeuPnQ; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=V8/6e3oD; arc=pass smtp.client-ip=81.169.146.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="EFeeuPnQ";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="V8/6e3oD"
ARC-Seal: i=1; a=rsa-sha256; t=1785624947; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NAo/o8qS2vTfVuBWRpafwZCTXQtnDAxH/wrWVkYIotAn4QEG+J6j8KgkOLF0NIphqg
    qT/YsICkQAaW/95FXi/muom4fMAr5F1jF5jZbXqgsfpPrNipOzfpgLsk+OS3VwY4Em0w
    nunsagTgHFlcWcKClmGeAbZKbC2t86L2pCNa6KcCtSs/jj+RlUifVEmRi/MH5s3+YHLd
    1oWI8CeuwS0/QPEc/FtoYUqI3a0Mcj9zq21gILQvFwNsVlVqrRRCW2RIbJe1aAsg6kY0
    EaLl6DJM0luB2WEK5FV1RXU6a6aakXkeMnplhKLjAyKTXkCPGrH9OdXT3HDA5vc443uX
    mjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1785624947;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5gYsB1PjJ7H7PuFJQUvn/QTdyGMZA6ECDbN3ychUHoc=;
    b=o5ibufNmyQzNtfSvuQvziadpdalrLAHXZofTTgziYyTKHhfZV+7CXtNFC+ZH17lhU/
    cX2kLHtxJk/k2YqElYJJ/FqX4x9bY5CMDQRcfGoxYwG1wwuS/kmlKoMDoA14CM0OgDE7
    9t9YGZuSfMb04CafM6N/evLa6cwGk3ksvf64Qd49rt9N+ufPHUXkj0GEl/8kXZPww+j1
    NZWrbU+C204KkY0uDlrnXZPDSFL8H7sT4YiuAQ6I9StT2DEOyrFg9P4hrD4qOWOdEzFS
    51qe8V9T05Qc2rsnokHgODz2qQjEoayuF3gVc4499d9KkvTidObIy0MbbYo5Aknr+mBc
    3Wpw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1785624947;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5gYsB1PjJ7H7PuFJQUvn/QTdyGMZA6ECDbN3ychUHoc=;
    b=EFeeuPnQ4cKDLTTVJ3snM/IttPc7Qf1hCmr/+LzdNXGc8Mf2eTvx/Gy6FkauO2Om48
    Kb02Zn9bwpphR0JPru6GNhGzgj19xeYTDXMsF5Yo+EDDaY68uvyAz3FUuw6tsG3CIQT7
    qikY1VeF1ZhDR+gT5KJ1p4wWk5jwLzp0khnKIWTHSbthZF1UJZzYyf+hlJjtpttl3fek
    2FdQz++jDRghYHnvXUr6WLhHW/JPLFN/EtOdXVLhjOcvJshx4lpFHYJz8MF7jgzA0eqf
    lb6RI80nWlJsSjUMfIabEgANKri45pgSfWqc+qTcXXdW8CPVPdppzKaPiRvDckn2Kf5J
    PVwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1785624947;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=5gYsB1PjJ7H7PuFJQUvn/QTdyGMZA6ECDbN3ychUHoc=;
    b=V8/6e3oDvIOkzkQEMGKBm+gRoSQFC8mreMnB5WWbamPZqTLLq47irHJ/XLkZLqqaVN
    KXO3Pam7LhYV21BymbBw==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUABIYZgv6aLDTL6Xu4hNwOa7LgT5qxJwPHjvVHn41xUN2XO6ElUUX"
Received: from cagnes.localnet
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id N4429c271MtlkMl
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 2 Aug 2026 00:55:47 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Sam James <sam@gentoo.org>,
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
Date: Sun, 02 Aug 2026 00:55:46 +0200
Message-ID: <15288158.RDIVbhacDa@cagnes>
In-Reply-To: <am50AM0bdufHa9W3@devuan>
References:
 <cover.1785532392.git.alx@kernel.org> <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Alejandro,

> > Your previous proposal "alx-0097r1 - <memory.h>, the legitimate header for
> > memcpy(3) et al." evaluates like this, IMO:
> >   * Benefit: Small.
> >   * Cost of adoption: Huge
> >     (there are more than 700000 references to memcpy() alone in Debian sources
> >     [1]).
> 
> There's literally no change.  The proposal includes this:
> 
>     7.28  String handling <string.h>
> 	@@ New subsection after title
> 	+7.28.<0+1>  General
> 	+1
> 	+	The header <string.h>
> 	+	includes the headers <memory.h> and <nonstring.h>.
> 
> Which means that <string.h> is still a valid provider of memcpy(3), and
> thus absolutely no existing code breaks.

Still, for the next 10 years, C programmers would debate whether they should
#include <string.h> or #include <memory.h>. Different C programmers in the
same team will have different personal opinions. Thus, programmer team leads
will have to establish coding styles/guidelines which say which header to
include in this case.

This is one of the challenges of language design: Each time the language
offers several nearly equivalent ways of doing the same thing, different
coding styles and the need for team guidelines are the consequence.
C++ is particularly affected by this; Go hardly. Pushing C to become
like C++, in this respect, would not be a good move.

The cost of adoption for this proposal is thus still big.

> > And, of course, for man page changes, consider the authoritative source.
> > For example, memfrob() exists only in glibc [2], therefore its authoritative
> > documentation is in the glibc manual [3], and it says "It is declared in
> > string.h." The man pages MUST say the same thing.
> 
> Yes, in v3 (which I'll send soon), they'll say the same thing.  That is,
> all the functions --standard or not-- will have text clarifying that the
> functions are also provided in <string.h>.  This covers what glibc says.
> What goes in the SYNOPSIS is something I'll diverge from glibc, but
> that's fair game.

I don't agree with you that it's "fair game". The SYNOPSIS is the first
eye-catcher, often the only part that a programmer reads. It would be a
disgrace if the man page, in the SYNOPSIS, mentions a different header than
the authoritative source.

Bruno



