Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7FD3382F7
	for <linux-man@vger.kernel.org>; Wed, 23 Sep 2026 23:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.156.224.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790207274; cv=none; b=JhB0wQ18GbxTdTiBlB66BnlzNU/hOhqQDMLZxqQhTdGuoQH+K1B3nbHkD+HJCS5YZklFlelsjaeiD52eYzKWK9DWWqdjxngxnsTx4jM6ioAGRHj7ff3TuNIFvV4jmS37vpdGfDUHXmVwspKmgBlyTUh9sA26QBNEwCzacaSeftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790207274; c=relaxed/simple;
	bh=zBA6U7fs337FF8/j3NDpru/ifPoY9tElj0+BCaDqa2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exwFhua3uzgfy1BOEyp3cywerXnZdrI+N7j0y3G3urdbBpjhUlWzvJNK/uprnLW6nff8o2e9/0HFbGNmSi2MQe/nQg16mei3zQayWI2uDVdvp1bMFsWG0rC9hOvFPQeTZ00Z+Ga5whGqR4IHBrQLz40dlEx0mAGm0VXsLSeyp1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org; spf=pass smtp.mailfrom=aerifal.cx; arc=none smtp.client-ip=104.156.224.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Wed, 23 Sep 2026 19:47:14 -0400
From: Rich Felker <dalias@libc.org>
To: Trevor Gross <tg@trevorgross.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, musl@lists.openwall.com
Subject: Re: [musl] [PATCH 2/2] man/man2/fork.2: Document glibc and musl
 relaxed fork->exec AS requirements
Message-ID: <20260923234714.GB23438@brightrain.aerifal.cx>
References: <44aca4d502f6891df1587ed1c4c9b6a1@trevorgross.com>
 <20260923233818.25289-3-tg@trevorgross.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923233818.25289-3-tg@trevorgross.com>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Wed, Sep 23, 2026 at 11:38:19PM +0000, Trevor Gross wrote:
> Link: https://lore.kernel.org/linux-man/20260923013428.GT23438@brightrain.aerifal.cx/ [1]
> Link: https://git.musl-libc.org/cgit/musl/commit/?id=167390f05564e0a4d3fcb4329377fd7743267560
> Signed-off-by: Trevor Gross <tg@trevorgross.com>
> ---
>  man/man2/fork.2 | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/man/man2/fork.2 b/man/man2/fork.2
> index fc78f786b..336c17448 100644
> --- a/man/man2/fork.2
> +++ b/man/man2/fork.2
> @@ -147,10 +147,17 @@ may be helpful for dealing with problems that this can cause.
>  After a
>  .BR fork ()
>  in a multithreaded program,
> -the child can safely call only async-signal-safe functions (see
> +POSIX specifies that the child can safely call only async-signal-safe
> +functions (see
>  .BR signal\-safety (7))
> -until such time as it calls
> +until it calls
>  .BR execve (2).
> +On glibc and musl libc, this is relaxed;
> +it is safe to call non-async-signal-safe functions in the time between
> +.BR fork ()
> +and
> +.BR exec ()
> +\&.
>  .IP \[bu]
>  The child inherits copies of the parent's set of open file descriptors.
>  Each file descriptor in the child refers to the same
> -- 
> 2.50.1 (Apple Git-155)

While glibc has taken measures to make this mostly work, especially
malloc-after-fork, I don't think glibc has an intentional model for
ensuring that arbitrary libc functions work right in the child of a
multithreaded fork. Before accepting such a man page patch, we should
at least get an official position from glibc on whether they claim
this property or at least aim for it.

Rich
