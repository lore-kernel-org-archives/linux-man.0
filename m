Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792690650;
	b=5ItBPEL51hZ3HXFU0srV59frFbW4Ekzz9Iu4eXkHLaTL1DHcc95nZm9O09N7yY6RoRer
	 gWZNPjOIjDFeBHRwUbLX7BKO7JTCyRNuRbNSOYzN2qhkUlZL7l/zUZ87ld78Tps8tiVsl
	 TMzlvZN8UwwJrkZ/u93eOTCQzpmZ2bK7/ZkG+rKSGGTOtom7jxA0uSe0vHufvc/t0LM4k
	 i+ky/TgNJr8v6SYGM96EHcUStZIotjLCWIx394PtM1iTsE/9a4brwOcMEe7ijom4Guu4/
	 ZRYMFNvIg+UqcJP5/hBSJ+3pWvoAbrgJjezEWKsICiHhi8oD1XEmTotMy/PykmDjd/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=B6oFzNLEDlHtmXQIvfTro1DMRtP5cZpzQ3ZN0UgKjnY=;
	b=rQQbq1NdCQXy1eVyYs027/FuxYBGm3FwFT7GaxiOUdaGSxngJP3+LyDke2sS1l6njfYx
	 jhErw5DTzt4XPBkZCniIgIdDmDYh889uNfgOnhfO9IAbRqelZR5HmGjayuQzpyfenTPmB
	 sfqOg8joVmwzSOzMYiUYVyOIIH77iV1EywYNuyW3S6OeLFCqOQ57RisocBmCIiYhSC4A5
	 Va4zAiSWLCEA+THLzCfMmqGPJCCJUahQsB5yCOlaRxcpkeFD3Rb6kbXaAx4vjfvHbz8OA
	 WRTcMQ2WAK/5y4G78ngpcOD/RDwVb5fGcSvLQPy2S4/hGTnq7TCt5JGqEmvQNsjhX0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=agtP9j6l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18540606A337
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18540606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=agtP9j6l
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35ef6b49813so109755eec.0
        for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 10:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792690649; cv=none;
        d=google.com; s=arc-20260327;
        b=bzmKpBDgP9oYWzhmXE9DMw0Nr3GtHdmuyTOwa21RJ6GdURA6lGJAS6OnG9af66CQLx
         /Cxlw9CpdVO5v6kRUvZrQkkbWrTkMngMOs494HrIbaBilvmHVety8nvJ7ARfJsU3gxmj
         eXJnM6QNapaY42NFl0J/tk52FRHQ+C6udYq2lBjQyxBByY+zxKkgzkF+2XCA/zeGsOPP
         dTb0OJlGSNIGlirC7xxYDzDHVrMtt49Kix+9dzeF70BiiQPMafb8/D4prnvU68ZyH0L8
         hbVL3rs1LFoRQEdHiDnKrL8zlyi6smfLRODYg/XYo7Vw8gV8j7lbb+2zay8d6MKWclXO
         DW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=B6oFzNLEDlHtmXQIvfTro1DMRtP5cZpzQ3ZN0UgKjnY=;
        fh=OclAtLKJTQTIvPXBcbgjquIcuF1L0TED2I15vb2Dds8=;
        b=s61g/7lunkU7URMlSuoRzFT7WR5GQT4RlxWjmM28Cwntd3WIu8l1mtp+P/AEkMWwQO
         oOYt9rFFcvU5rBoSXUIUqcdrWMgswvMZ+yEPA9IdDN7M4pJezjr5Ikp7iaNcjpOt8uhL
         6J1PRonUZgWmuGeqiAGcX3yMPwWPpuujq1vkEtqjY2S4k34QV1CVlkmFExEuMGa3S7tX
         +Vcmmk+QHqBrHstn7YCK0mancMu720X5uK+V1keY06BTEoLcZwd62wqbYMzdI40+q6pP
         62jV8o9SJBxWOstEEDf8kGd4MXg6MSz4EzMg7ZFTtAH/jNjkrEE6bqZJqMz3LgscxRys
         2YhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792690649; x=1793295449; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6oFzNLEDlHtmXQIvfTro1DMRtP5cZpzQ3ZN0UgKjnY=;
        b=agtP9j6lRImwwxnRkhU67QFTcVuJyiH8Nmk9FstIeqZfR0aUpuRXexyiKGHx2QcpWW
         MrQXpla7xx8uN1h0H9RPop1709Y+e9tT3x0PU1fdxUyjkwiAOGWXLIQQsOhzWLAXOtaA
         jnzmTpyp1nLHB/m9mLZ+s95a49WFNXBOljdPS2dk9IuDu/MXir0kvFBuxvAGV7JWsz7s
         LfrTnzLE9scPitVSLCeUc1kqQbUMkPNClJ4e++KVJGbNHH2y8eonp7A6VEMrnUf5JYBr
         Q9aXnT8hLIMtnCjIi8mor43Cc61OUIyZjQBNmjxNB+YFtOgr/3jCJXm90pMvvSH9iJeo
         SxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690649; x=1793295449;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6oFzNLEDlHtmXQIvfTro1DMRtP5cZpzQ3ZN0UgKjnY=;
        b=lxoShm6g2cts6Zx4fLB6n1LWOKakyT1T1291gGmlRpmoiKlqgt4y/nGhHzfs/mN8DU
         /iABZ/mdrvM1VKCLp7M/Nr+bH81BOPIphL9vtfpMmdMzzFPY1QJDw7ZvWQZFonuqAhXa
         p53aAnEBjR6HY477euTyo8tHRt40qHPh21QbOP9PQMk9eGzkVvRT9QrVryR1WFv/L00W
         QLqiKtybmYPgS9/RY6rqzfeZ2qmB3bq2QXwG0JLp6y0uAJUSd9X2QTKD69zsiB6gNDjj
         fkWbWQV0EswlyyVn6QMkawzMuWgvCMKQtOmLGVVIqm+1S7RtM+j+E/sBmlQP3XO/GhGe
         t4OA==
X-Gm-Message-State: AFq9FYLzXcFsHiiBxMJwLuQnxnwWcCXfK0i7prP93mzL+VmPq7SCWYjl
	zVT/g0KeDLt8qfmZtFRhXrVS1yoAHrjl4BpAXBcAp66Obg55B8D3mqKaKeJejg3jroKs2Rcf+T2
	AzdVjjYJlKvhb/9DcVb+uOmurwZGLnk4z4lVy
X-Gm-Gg: AYBFou1xKcQrUaCEP6kyxQX/lezBRFvylfjVq8Z6kHFcAWjOyf7+Sd6mKbWdQRKqylN
	S9LWloqJVTmBGacbB8MGQGFo62WkLsFw5A+weRyKXTlCjtzJ71DIDZTYjSBPyLL3WxckCpyUyBo
	vU94VYO6U6uqNZIj6tsInUrtzE2/OOeOER1Y4xdEK03eig6cT3jnlkLG+N1m6rpxy9VEiN69Kdg
	vfVToGxpVU+U65e/391ooNfn/tyIhAjzqqSibhWkSIW3OMLAT0TLzd/5tfHR2F2ORc2JVafbEIP
	bTjlkpcaWjhksjHeW5TvLRlr/FsCu6EyBLb3XYXByfJh9j82xTGzbl2YZ/3mWQLogXnN9hu6MB+
	x7UM0qPyrkn1+1tsr4WSUXADq2r2r+4e7683PfabJUTEu3xVkbCk6Kl2Kdxk8jaWUZE3FHhfK11
	m8AZ+xqBHSonwww/s9gdgpvChKoSLFE3gaGB4SM5TGIg1z
X-Received: by 2002:a05:7300:80d6:b0:35d:2c2b:215a with SMTP id
 5a478bee46e88-3674f11d996mr10652767eec.35.1792690648916; Thu, 22 Oct 2026
 10:37:28 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
In-Reply-To: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
From: Christopher Bazley <chris.bazley.wg14@gmail.com>
Date: Thu, 22 Oct 2026 18:37:16 +0100
X-Gm-Features: AclHuK9REBYnx3uWYz3JjuYSAfpiW_pmRBQ8Keklkf_jIzgWZp1kE8TiVqY43ww
Message-ID: <CAEHU8x-d1aeRC8JgArpXs-4yJQ5XZY2U8OrcxAFnYcFEM3Xp+w@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alejandro,

On Thu, 22 Oct 2026 at 17:45, Alejandro Colomar <alx@kernel.org> wrote:

> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
> From: Alejandro Colomar <alx@kernel.org>
>
> I'm not fully convinced of this patch.  But I'm open to being convinced.
> I've written the patch, as Michael asked me to do, but am willing to
> hear everyone's opinion before applying the patch.

Why did Michael ask you to do this?  I think there is some context missing.

> As Michael reminded me recently, and as I've defended in other cases, it
> is true that the SYNOPSIS of the manual pages does not need to be
> strictly valid C.  It only needs to be useful enough for readers to
> understand the interface.  Thus, if using lengths without declaring them
> would improve the usefulness of the documentation, even if becoming
> invalid C, it would be okay.
>
> However, I still have doubts, because this change comes with risks:
>
> Programmers might think it is valid C to refer to parameters that have
> not been declared yet, and use that in their code, and if they are
> unlucky, it might compile for them, which might result in UB at some
> point.
>

I think it is reasonable to assume that anything which resembles C source
code will at some point be copied and pasted into a C program.

> One valid point is that this is rather unlikely to happen, and most of
> the time it will just result in a compiler error, because no global
> variables with the name of the parameter exist.
>
> However, with local (nested) functions, this might be easier to happen,
> as variables declared in the outer function are more likely to share a
> name with a length parameter.  Given that the C Committee is working
> hard to standardize local functions, it might be a very bad idea to have
> this combination of events going on.
>

I agree with this concern in general, although I don.t quite see how it
applies in the specific case of the functions that you are documenting.
(Unless you are expecting those functions to be declared inside a function
definition instead of by including the appropriate header - in which case
the hazard already exists.)

I guess you are really worried about people copying the style rather than
the content.

> Concerns that have been raised against using the GNU C syntax in the
> manual pages:

Parameter forward declarations are also supported by SDCC, albeit with more
limitations. I would be interested to see whether your usage falls into the
category of usage that would be supported by SDCC or not.

> Very very few programmers know this syntax, and thus they are confused
> when reading it for the first time.
>
> This is obviously true.  However, this is true of any innovative syntax.
> We should consider whether the confusion is dangerous or not, and
> whether programmers can learn it easily or not.
>

Can we still call it innovative, many decades after its invention?

>
> I believe once you've been exposed to this syntax, after some research,
> or asking the right people, one would easily learn to read it, and then
> we'd have overcome the issue.  I don't think the syntax is inherently
> difficult to understand once you've seen the documentation and seen it
> a few times.
>
> Also, this syntax is not very dangerous: a programmer thinking
> that a forward declaration is actually a normal parameter will pass a
> wrong number of arguments to the function, and thus will have compiler
> errors.  This syntax is quite robust, as it requires several bugs to
> happen in the same code to pass compilation silently.  If one replaces
> ';' with ',', the parameter will be declared twice, which is an error.
> If one renames a forward declaration, it will not match a parameter, and
> will result in a compiler error.  Only if both mistakes happen at once,
> the compilation would pass, but then the call sites would also have to
> match the bogus declaration.  And also, the function definition would
> have unused parameters, which would trigger diagnostics.  So, concerning
> safety, this feature is not very dangerous, even if used by someone who
> is very confused.
>
> Do we think programmers are unable to ever learn this new syntax?


No, because programmers are clever and it is relatively simple. I wrote a
paper that explored the drawbacks of the syntax and recommended
standardising a subset (which I assume is what you are using). With a free
hand, I might have been tempted to go further, but it is well-established
and impossible to redefine.

I still have not yet seen a proposal for anything easier to learn (that
does not rely on forward-parsing).


> Are we ready to accept the risks of using the dangerous invalid syntax,
> but which is more intuitive to programmers?
>
> Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
> Not-yet-Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>
> I've cut the diff below to just a single page, because this is just for
> discussion; the actual diff is huge and uninteresting.  It's just a
> removal of all uses of fwd decls of parameters in the manual pages.
>

I don't agree with the change, but the fact that there are no useful ISO C
semantics for parameters of pointer type declared using array syntax
weakens my concern. (If the parameters actually had variably-modified types
then the change would be far worse, from my point of view, because the
parameter types would no longer be expressed correctly.)

You know your customers better than I do. If they expect GNU C semantics,
then it seems reasonable to document those semantics using GNU C syntax.

Christopher
