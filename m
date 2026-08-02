Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE27394785
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785705829; cv=none; b=d83INeTmYtceyR9ZnldVw+BiMoo5IA49zAYnObMbQZ72t77Mbu697k8qp6pp4O5uyIrqU7wXdGWJC+Cavu/1vlftmvIGk8KluD6M62yp+sMH1DSRx+0lBFiZdplgSQGENxKf28Y4mJDDzy4xTgEjHPdndifrxTxYR9awC6sPQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785705829; c=relaxed/simple;
	bh=RXiTadYA+GuPgTWHnvQYgSbYKZUnJ+qgridtJh94wp4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RzNzezIq+e8BapIzEotufGGDtrjzj7K6APNl1bLXcHzvjwExzP77OMmEvaS6Fldku3JV24ZvCFZDmQIeN08JIPUoXPuVnrzxR/U3R7A5tA+pnhq1iPrw8RYcQe4DBjR44EkEPUWaGVGx3RrHSkp2hSvJGqSXOv2O2fogcKYtlOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AF7CA92009C; Sun,  2 Aug 2026 23:23:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A97A992009B;
	Sun,  2 Aug 2026 22:23:36 +0100 (BST)
Date: Sun, 2 Aug 2026 22:23:36 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Alejandro Colomar <alx@kernel.org>
cc: Collin Funk <collin.funk1@gmail.com>, 
    "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
    Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
    bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
In-Reply-To: <am6X32HkGdm2xTd7@devuan>
Message-ID: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
References: <cover.1785532392.git.alx@kernel.org> <3556566.BddDVKsqQX@cagnes> <am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes> <am56ZBzNM5J07AUa@devuan> <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu> <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid> <am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 2 Aug 2026, Alejandro Colomar wrote:

>      The  original implementation in glibc would have been con‐
>      forming to C99.  However, and ironically, trying to comply
>      with C99 before the standard was released,  glibc  changed
>      its  behavior  in glibc 2.1.1 into something that ended up
>      not conforming to the final C99 specification (but this is
>      debated, as the wording of the standard seems self‐contra‐
>      dicting).

 Well, this was a period when glibc was driven by personal preferences of 
one particular maintainer, so I don't think it is a good example in this 
discussion.  What problem are you trying to fix anyway, what's wrong with 
using <string.h> for the APIs in question?

  Maciej
