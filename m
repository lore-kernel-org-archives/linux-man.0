Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.27.2.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792828450;
	b=d+ZVYSElGooFlFkxIgBn0TB6BJfTCSVwwHSUkn+BquPFXXuLEnst5sO8fekw7XFTbqWl
	 8VEfUb/xHpaWijZzx0JYYTEfqGFjK0tkpaCfFZlpRcE2wt5qSROpL3V/5kizW8o0YWyZZ
	 ld1FIc38eI5bFi1HIBVmpNjDH4rqu23nMEBd42417/NuAGKntrnz9RICRa21DFlPrfnnT
	 p3XjycMitKGBfCRUC96/fiSnfsuuYORqvyKQx0XMKU3XUc9KGuEhUzwqUuqVg3DL3KPe/
	 +mvPZ6bSTwOJHpS5WKo+dH28TIhOyZ9mKsrLTJhk1sp9o4lIiwIZCCcsz4cRKQGG9Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792828450;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-TUG-Backscatter-control:X-Spam-Scanner:
	 X-Spam-Score-relay:X-Scanned-By;
	bh=9B3/GPZX9JvpB3LCSb80DPw2nOFslfu45KPFPHl/xWY=;
	b=nY0dJVYCIUz56/+sgo8FToHW7l6LjKsuia8qXqoZ/7Yq0nw3nYU7jVw4gQ7tlDsPZfZ6
	 IB5CBGt+l513lsytJnB7oi+YnbCOEbvWO+H8w490l1HbNHp6/nukNDS6+3v9CeTLmBLzJ
	 WUGLP+mtpT5q+WXymQ8VU2JY/P+AFCeJClZY7AkS2qaZfqZY/5huVwlnDVsrN1KkJ1Mqj
	 1Aa3qlbkUQYha7bujf6SuY2W3JF6Q90eYkxYPCjhAsSL5l7Co9VZ52GHP6WsX+KFmzdgI
	 SpkGGltC5G0nP7GjaFnKKJNL09F9DX9L9Z0SOtsijWIYxiz3/tLGAQ8fmGnRl5ltxkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tugraz.at;
	spf=pass smtp.mailfrom=tugraz.at;
	dkim=pass header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=Y6+EXqax;
	arc=none smtp.remote-ip=129.27.2.202
Received: from mailrelay.tugraz.at (mailrelay.tugraz.at [129.27.2.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E770A606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 07:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E770A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tugraz.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tugraz.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tugraz.at header.i=@tugraz.at header.a=rsa-sha256 header.s=mailrelay header.b=Y6+EXqax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tugraz.at;
	s=mailrelay; t=1792828434;
	bh=9B3/GPZX9JvpB3LCSb80DPw2nOFslfu45KPFPHl/xWY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y6+EXqaxv8IY8znZJ7l/PpmcVZ0Ydbx7uoN2Wbf7e6XXNSkn+Adll6VIvpfcAVYpl
	 irpTaPkXwq+J0/NWoB7uXLJioT5n/jQSvGr5eAlE7XHXCN1NSMVddshnNNNbqx6Z76
	 ZXe48qs14VfZC7emI0YeZy8dOX5NLyBl8IO/oTvM=
Received: from [192.168.0.221] (84-115-216-212.cable.dynamic.surfer.at [84.115.216.212])
	by mailrelay.tugraz.at (Postfix) with ESMTPSA id 4jBXFq5fFJz9s0v;
	Sat, 24 Oct 2026 09:53:51 +0200 (CEST)
Message-ID: <9fbf8591cbf80a74954ce5a7d39368851f2daf38.camel@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
From: Martin Uecker <uecker@tugraz.at>
To: Mark Harris <mark.hsj@gmail.com>, Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Alejandro Colomar <alx+linux-man@kernel.org>,
  Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley
 <chris.bazley.wg14@gmail.com>, Sam James	 <sam@gentoo.org>, Carlos O'Donell
 <carlos@redhat.com>, "Joseph S. Myers"	 <jsm28@cam.ac.uk>
Date: Sat, 24 Oct 2026 09:53:51 +0200
In-Reply-To: <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>
References: 
	<79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
	 <CAMdZqKEWzg6Z5oYp8N+S4rkOjUU7WT6jwbVDCAk3YN3ZdP7u+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-TUG-Backscatter-control: G/VXY7/6zeyuAY/PU2/0qw
X-Spam-Scanner: SpamAssassin 3.003001 
X-Spam-Score-relay: 0.0
X-Scanned-By: MIMEDefang 2.74 on 129.27.10.116


I personally do not quite see much risk for mistakes
either way. =C2=A0

I think the more imporant question is whether
man pages will use its role to help make the C ecosystem
safer by educating people about forward declarations as
a tool that directly improves safety of C code, or whether
it wants to remove any friction for users that simply
want to get a job done.  Both a valid positions.

In light of the fact that safety is a critical problem
for old-style C code, I personally would be more happy if
it prioritizes safety over use convenience, but this is
not my decision.


Martin



Am Donnerstag, dem 22.10.2026 um 15:03 -0700 schrieb Mark Harris:
> Alejandro Colomar wrote:
> >=20
> > From: Alejandro Colomar <alx+linux-man@kernel.org>
> >=20
> > From: Alejandro Colomar <alx@kernel.org>
> >=20
> > I'm not fully convinced of this patch.  But I'm open to being convinced=
.
> > I've written the patch, as Michael asked me to do, but am willing to
> > hear everyone's opinion before applying the patch.
> >=20
> > As Michael reminded me recently, and as I've defended in other cases, i=
t
> > is true that the SYNOPSIS of the manual pages does not need to be
> > strictly valid C.  It only needs to be useful enough for readers to
> > understand the interface.  Thus, if using lengths without declaring the=
m
> > would improve the usefulness of the documentation, even if becoming
> > invalid C, it would be okay.
> >=20
> > However, I still have doubts, because this change comes with risks:
> >=20
> > Programmers might think it is valid C to refer to parameters that have
> > not been declared yet, and use that in their code, and if they are
> > unlucky, it might compile for them, which might result in UB at some
> > point.
> >=20
> > One valid point is that this is rather unlikely to happen, and most of
> > the time it will just result in a compiler error, because no global
> > variables with the name of the parameter exist.
> >=20
> > However, with local (nested) functions, this might be easier to happen,
> > as variables declared in the outer function are more likely to share a
> > name with a length parameter.  Given that the C Committee is working
> > hard to standardize local functions, it might be a very bad idea to hav=
e
> > this combination of events going on.
> >=20
> > Concerns that have been raised against using the GNU C syntax in the
> > manual pages:
> >=20
> > Very very few programmers know this syntax, and thus they are confused
> > when reading it for the first time.
> >=20
> > This is obviously true.  However, this is true of any innovative syntax=
.
> > We should consider whether the confusion is dangerous or not, and
> > whether programmers can learn it easily or not.
> >=20
> > I believe once you've been exposed to this syntax, after some research,
> > or asking the right people, one would easily learn to read it, and then
> > we'd have overcome the issue.  I don't think the syntax is inherently
> > difficult to understand once you've seen the documentation and seen it
> > a few times.
> >=20
> > Also, this syntax is not very dangerous: a programmer thinking
> > that a forward declaration is actually a normal parameter will pass a
> > wrong number of arguments to the function, and thus will have compiler
> > errors.  This syntax is quite robust, as it requires several bugs to
> > happen in the same code to pass compilation silently.  If one replaces
> > ';' with ',', the parameter will be declared twice, which is an error.
> > If one renames a forward declaration, it will not match a parameter, an=
d
> > will result in a compiler error.  Only if both mistakes happen at once,
> > the compilation would pass, but then the call sites would also have to
> > match the bogus declaration.  And also, the function definition would
> > have unused parameters, which would trigger diagnostics.  So, concernin=
g
> > safety, this feature is not very dangerous, even if used by someone who
> > is very confused.
> >=20
> > Do we think programmers are unable to ever learn this new syntax?
> > Are we ready to accept the risks of using the dangerous invalid syntax,
> > but which is more intuitive to programmers?
> >=20
> > Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
> > Not-yet-Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > ---
>=20
> The man pages are frequently used when seeing a call to an unfamiliar
> function, to understand what the function expects and what it is doing
> with those arguments.  The arguments in the call are matched to the
> synopsis by order, not by name, so for example a person questioning
> the first argument would naturally be looking at the first thing after
> the "(" to find out what is expected there.
>=20
> A person that is reading the description, where it refers to the
> arguments by name, needs to convert that name to the argument number
> in order to match it to the arguments in the actual call.  The natural
> way to do that is to count the argument names in the synopsis (at
> least those not preceded by an unterminated bracket or comment) and
> stop when that name is found.  For example if that is the first
> argument name after the "(" in the synopsis then it would be natural
> to conclude that it matches the first argument to the call, and not
> continue scanning to see if there is another occurrence of the same
> argument name.
>=20
> So I agree with Michael that this change is a good one to make the man
> pages less confusing.  Thanks for creating the change.
>=20
>  - Mark
