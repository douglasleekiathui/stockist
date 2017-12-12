package sg.edu.nus.iss.sa45.team4;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.sitemesh.content.tagrules.html.DivExtractingTagRuleBundle;

public class MySiteMeshFilter extends ConfigurableSiteMeshFilter {

	
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
	// Map default decorator. This shall be applied to all paths if no other paths match.
	   builder.addDecoratorPath("/*", "/WEB-INF/decorators/Layout.html")
	          // Map decorators to path patterns.
	          .addDecoratorPath("/backend/**.do", "/WEB-INF/decorators/adminDecorator.jsp")
	          // Map multiple decorators to the a single path.
//	           .addDecoratorPaths("/articles/*", "/decorators/article.html",
//	                                             "/decoratos/two-page-layout.html",
//	                                             "/decorators/common.html")
	          // Exclude path from decoration.
	          .addExcludedPath("/login/**")
	          .addExcludedPath("/main/**")
	          .addExcludedPath("/popup/**")
	          .setMimeTypes("text/html", "application/xhtml+xml", "application/vnd.wap.xhtml+xml");


	   // add div tag rule
	   builder.addTagRuleBundles(new DivExtractingTagRuleBundle());
	}

}
