Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E038F629
	for <linux-man@vger.kernel.org>; Fri, 24 Jul 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919310; cv=none; b=DL1sg5WWZygLx/lbwGHIbIxxg7RuFsIyngJhN8xcRNs2BFyvoAEf/9/tMifoQ/ViFlijrsng3Zi5vOvoUEzyE40XYYb/O5B94FlUZOoTfatChiNeH02fdpKT3rNdPdKcDC5+HHgbU1r+AT2gkp8gCimghkheAR9+pXE6pgauy0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919310; c=relaxed/simple;
	bh=oFYfW1MXcPz1RORsLXKK0XCj16b5FCwF0xWK3filnjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoErHx7TjCU5dzndM345YdHnm8Q/YsgjUc0hAFgCsQ4e5eGkVJHPSjyNqnYjWrnQBNJPH6Xodi0QQE/lbW2ICKQCSrOA2ADvTqfkxg/pamM7b2H5fxzWm+m/Odl/iKFnxdzcNgqLxPWyhJbGb5b+XfsMPXe4+R0nW7KcrqOnIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+OgD62/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+OgD62/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05F61F00A3A;
	Fri, 24 Jul 2026 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784919309;
	bh=QETOpFaHk73+zVGIinFpmn+lemoxE0OPOGu4/Q6R90w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L+OgD62/pD6xUSmiwZLgw5aECbAku/i1eOVekcKCYCHDbC7Yl1VqLRJTW6ntnDti4
	 aqm44r3s2peDQ629wpJu6bQMKUDUbNX5qYeLK+PKwhO//BIFTpbYSu+omI8wuGwtTE
	 frnAA1XThqh24WaxAT+PeYyVJGgToU05W9RTLTwh9EKHMpOYIUITDRA9nbbBXcvgux
	 18U0D9cmjtfGpDB0Y/uSaC34zQTzdkNOSBHoL47fCxtgvgc2VhUxYvWp5Tc1d11zJ9
	 i62EP6ri+yLZzpY1/vo6CJ+D1/bg7C0v2GUcw2jJPY7rrPY0HNj7ouTgGK1qewUUj4
	 kXQKHtQNGYseA==
Date: Fri, 24 Jul 2026 13:55:05 -0500
From: sergeh@kernel.org
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
	Mark Harris <mark.hsj@gmail.com>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 3/4] man/man3/mem*.3: NAME: Explain the names
Message-ID: <amO1CUmICAuiAAmS@AUS2MQ6190Y76.amd.com>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <dcc7a485cbe0f7fcef3bd16bd419a744d8c6e04b.1783523064.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcc7a485cbe0f7fcef3bd16bd419a744d8c6e04b.1783523064.git.alx@kernel.org>

On Wed, Jul 08, 2026 at 05:09:17PM +0200, Alejandro Colomar wrote:
> Reported-by: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: Mark Harris <mark.hsj@gmail.com>
> Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

Acked-by: Serge Hallyn <sergeh@kernel.org>

> ---
>  man/man3/memalign.3 | 4 +---
>  man/man3/memccpy.3  | 2 +-
>  man/man3/memchr.3   | 2 +-
>  man/man3/memcmp.3   | 2 +-
>  man/man3/memcpy.3   | 2 +-
>  man/man3/memfrob.3  | 2 +-
>  man/man3/memmem.3   | 2 +-
>  man/man3/memmove.3  | 2 +-
>  man/man3/mempcpy.3  | 2 +-
>  man/man3/memset.3   | 2 +-
>  10 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/man/man3/memalign.3 b/man/man3/memalign.3
> index 12e8a5bb0c33..5954693e3d30 100644
> --- a/man/man3/memalign.3
> +++ b/man/man3/memalign.3
> @@ -5,9 +5,7 @@
>  .\"
>  .TH memalign 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memalign
> -\-
> -allocate aligned memory
> +memalign \- memory aligned allocate
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memccpy.3 b/man/man3/memccpy.3
> index d21e7d014af6..706f8152f58c 100644
> --- a/man/man3/memccpy.3
> +++ b/man/man3/memccpy.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH memccpy 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memccpy \- copy memory area
> +memccpy \- memory until-and-including-character copy
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memchr.3 b/man/man3/memchr.3
> index 40ea45fdfb83..0a493ff4029d 100644
> --- a/man/man3/memchr.3
> +++ b/man/man3/memchr.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH memchr 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memchr \- scan memory for a character
> +memchr \- memory search character
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memcmp.3 b/man/man3/memcmp.3
> index 815bd10252fe..9cecb282ba4f 100644
> --- a/man/man3/memcmp.3
> +++ b/man/man3/memcmp.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH memcmp 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memcmp \- compare memory areas
> +memcmp \- memory compare
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memcpy.3 b/man/man3/memcpy.3
> index c94c501b0374..f8f049bf5c4c 100644
> --- a/man/man3/memcpy.3
> +++ b/man/man3/memcpy.3
> @@ -7,7 +7,7 @@
>  .\"
>  .TH memcpy 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memcpy \- copy memory area
> +memcpy \- memory copy
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memfrob.3 b/man/man3/memfrob.3
> index 90534b749c4c..ee41da0ced7b 100644
> --- a/man/man3/memfrob.3
> +++ b/man/man3/memfrob.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH memfrob 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memfrob \- frobnicate (obfuscate) a memory area
> +memfrob \- memory frobnicate (obfuscate)
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memmem.3 b/man/man3/memmem.3
> index 0224a130537e..13fd8b7cea7b 100644
> --- a/man/man3/memmem.3
> +++ b/man/man3/memmem.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH memmem 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memmem \- locate a substring
> +memmem \- memory search submemory
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memmove.3 b/man/man3/memmove.3
> index c549c6145176..99f152412142 100644
> --- a/man/man3/memmove.3
> +++ b/man/man3/memmove.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH memmove 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memmove \- copy memory area
> +memmove \- memory move
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/mempcpy.3 b/man/man3/mempcpy.3
> index d5ae5812758e..012e6326dd00 100644
> --- a/man/man3/mempcpy.3
> +++ b/man/man3/mempcpy.3
> @@ -7,7 +7,7 @@
>  .\"
>  .TH mempcpy 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -mempcpy, wmempcpy  \- copy memory area
> +mempcpy, wmempcpy  \- memory return-offset-pointer copy
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> diff --git a/man/man3/memset.3 b/man/man3/memset.3
> index 370ac64fdf25..91b3b476abf9 100644
> --- a/man/man3/memset.3
> +++ b/man/man3/memset.3
> @@ -6,7 +6,7 @@
>  .\"
>  .TH memset 3 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -memset \- fill memory with a constant byte
> +memset \- memory set
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> -- 
> 2.53.0
> 


