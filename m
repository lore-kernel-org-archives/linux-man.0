Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7B1FBEA8
	for <linux-man@vger.kernel.org>; Mon, 18 May 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113082; cv=none; b=mtUM2clr9B0ZPe+X3sC/+ZZ0STD8/5JFpfTPNbYO2/WwwtTLGTfI1eYKKCuAwqTJGa9X15Pdn6rgaWby10ScfVlaXZlp6kJ59p22xesXhYCgW1RaIn1JN0RrbqtHpmSng4IoiZiequBX4AZyTzEUvUv86laJOa9QpYS6CDXrolY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113082; c=relaxed/simple;
	bh=A/+nBPlzq2NC4qtFoGm7HTpoTB/2OvBEu8bjWWyYcKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYksT0lgiccXftd3pecMA7mtpmi44X5jZDXQRqYTs9qnaYBU09BIlopO/yiAumOb81pUdPikiQcDG+fImWcyda6RdPnXjXYQucJridNdQ/nubGkkHO23rQE/NJNjx8TU4YuOaZ5ETEiJ65dFt4/dE61c+rzWPGQ6bcwJ11GpaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EallOLn6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EallOLn6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6AAC2BCB8;
	Mon, 18 May 2026 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779113082;
	bh=A/+nBPlzq2NC4qtFoGm7HTpoTB/2OvBEu8bjWWyYcKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EallOLn6VQ4Yju9W4poAPgOLEufR3vCHiVzsVtF0wS47by2yRUyOSRXgtVdreVS9G
	 4Kle1KvWkFQrH8jjUPUmaG0fnj/cR5aZ7CNbUH6qc68JSE04RMszKbnBvqbWFIUg4+
	 ovHEhVsFAa++sL2GHEj3iZ2Ny+Rti92rT6aV3hFhrizcxD+PgmDRxd0SBC/abAf/IO
	 mtz+BO8ptkN18wneCA4MdaKPEwzCsoWu5wbVnS/KTm3lFr1rVlUKCNr1PLerVA8k7Z
	 Rkqf9Am3WJlluf797qZ2FeRvzLYoRZJ5v9sV+DAj59JXHe/5uZhgV3kxSmIMsETNDk
	 aN2SPta5601Ew==
Date: Mon, 18 May 2026 08:04:40 -0600
From: Tycho Andersen <tycho@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: funsafemath <funsafemath@proton.me>, linux-man@vger.kernel.org, 
	Tycho Andersen <tycho@tycho.ws>
Subject: Re: [PATCH 1/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_TSYNC_ESRCH
Message-ID: <agscUq8v8623uLMb@tycho.pizza>
References: <agjZM97qL3w4JZBX@nix-mail>
 <agjag_tIzuKpME-B@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agjag_tIzuKpME-B@devuan>

On Sat, May 16, 2026 at 11:38:48PM +0200, Alejandro Colomar wrote:
> Hi,
> 
> On 2026-05-16T21:53:17+0100, funsafemath wrote:
> > Document SECCOMP_FILTER_FLAG_TSYNC_ESRCH flag, which allows to
> > use SECCOMP_FILTER_FLAG_TSYNC and SECCOMP_FILTER_FLAG_NEW_LISTENER
> > flags together by returning ESRCH on synchronization error instead
> > of the thread ID.
> > 
> > <https://lore.kernel.org/r/20200304180517.23867-1-tycho@tycho.ws>
> > ---
> 
> Would you mind signing the patch?
> 
> >  man/man2/seccomp.2 | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/man/man2/seccomp.2 b/man/man2/seccomp.2
> > index 75c7b2d58..0729a653c 100644
> > --- a/man/man2/seccomp.2
> > +++ b/man/man2/seccomp.2
> > @@ -241,6 +241,21 @@ .SH DESCRIPTION
> >  .B SECCOMP_MODE_STRICT
> >  or if it has attached new seccomp filters to itself,
> >  diverging from the calling thread's filter tree.
> > +.TP
> > +.BR SECCOMP_FILTER_FLAG_TSYNC_ESRCH " (since Linux 5.7)"
> > +.\" commit 51891498f2da78ee64dfad88fa53c9e85fb50abf
> > +Return
> > +.B ESRCH
> 
> I expect that in user space, we'll see -1 in the return value, and ESRCH
> in errno, right?  If so, we should say "Fail with ESRCH ...".

Yes, exactly. Probably worth changing the wording in the commit
message as well.

Tycho
