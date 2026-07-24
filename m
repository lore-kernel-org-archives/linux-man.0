Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F138A70A
	for <linux-man@vger.kernel.org>; Fri, 24 Jul 2026 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919190; cv=none; b=F9AG6KRt61BszMjqW8+cahaj0vKUk0HAE2KRDHbG+C0PGLDYQ/AUTPqdjQJJKEFP0ch3tfa9J3zEdQDK6LRX+q5qjU+qpAIvi61Z+oQrZP/6poOKXMdhSNL48rb77WsBePWJ6rXBI7lTsVvmnm1gA3sLmYQI5ZISnCZZgvPBy/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919190; c=relaxed/simple;
	bh=313ouolXRPcWKJkYXXOFGhhy/3Ho+XqwY2FNs1ZOGFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6ff0ojHKvQZRS99HdPZGW3QhIT9lWb1+4VWuBVR/n4JelxzUnsP8cnaPc7CVm4d9PFGspQiS3LBG5APoc29X5cLqnu0iMxFLtXlfCo93F9WRcJMMZBmT1DZsLGURgjVDFMWipoqyH4PRwyO+Z1aujKdgRPpjG8aSSvY9zONrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PERb/73Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PERb/73Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467FC1F000E9;
	Fri, 24 Jul 2026 18:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784919188;
	bh=uEnCr6rKT24AX7zbNpPbJAf7fx6Wm1U5GzG2xFco1Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PERb/73ZH2IIqRHSw7uPZF5vw8rsjUN95Q0n1KIIFxh++vLpj56VcPhc60K2X2Nba
	 ek5szPuIWljd67JuZrMBYU/Ug3OtQSVBlutowPjOY7wKiw89J8VH+KUjenjqLmh56A
	 4Rgd9qYksK/HRvTFUOA56Rt9DSDoOD2yrtyC4kd7wZW5oe8E2b2XXJoi9h/FMUQCzG
	 uoiFcbhvzpbKT+N9fB2Iatm1TxDnpXH/MhVnNfbSQ34GPfXJW1JfDElJp1hWZ9xaDS
	 wKLWBSSu76KqO2t/VeR0IBKtd7Qf7H6Mi1b1nmMHYjz/MveajQI47o5mxoRZWgVXd2
	 yhH8w0g9m4FYw==
Date: Fri, 24 Jul 2026 13:53:04 -0500
From: sergeh@kernel.org
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
	Mark Harris <mark.hsj@gmail.com>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 2/4] man/man3/strpbrk.3: BUGS: Clarify the NAME
Message-ID: <amO0kDE-r6ZFIr3t@AUS2MQ6190Y76.amd.com>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <a7508ac0f477f102582f2ac20b3c30ab25c1f7f7.1783523064.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7508ac0f477f102582f2ac20b3c30ab25c1f7f7.1783523064.git.alx@kernel.org>

On Wed, Jul 08, 2026 at 05:09:13PM +0200, Alejandro Colomar wrote:
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: Mark Harris <mark.hsj@gmail.com>
> Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

D'oh, i should have read this one before the comment to patch 1 :)

Acked-by: Serge Hallyn <sergeh@kernel.org>

thanks

> ---
>  man/man3/strfry.3  | 2 +-
>  man/man3/strpbrk.3 | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/man/man3/strfry.3 b/man/man3/strfry.3
> index 54ea313ea262..a65603af918a 100644
> --- a/man/man3/strfry.3
> +++ b/man/man3/strfry.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH strfry 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -strfry \- string fry
> +strfry \- string fry (obfuscate)
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/strpbrk.3 b/man/man3/strpbrk.3
> index 6e5b79a48bbe..ee7a84f1a944 100644
> --- a/man/man3/strpbrk.3
> +++ b/man/man3/strpbrk.3
> @@ -51,6 +51,10 @@ .SH STANDARDS
>  C11, POSIX.1-2008.
>  .SH HISTORY
>  POSIX.1-2001, C89, SVr4, 4.3BSD.
> +.SH BUGS
> +The name of this function is bad.
> +It should have been named strchrs().
> +The NAME section above reflects this.
>  .SH SEE ALSO
>  .BR memchr (3),
>  .BR strchr (3),
> -- 
> 2.53.0
> 


