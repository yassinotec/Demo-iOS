// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
	public enum InfoPlist {
		/// Demo
		public static let cfBundleDisplayName = L10n.tr("InfoPlist", "CFBundleDisplayName")
		/// Demo
		public static let cfBundleName = L10n.tr("InfoPlist", "CFBundleName")
	}
	public enum Localizable {
		/// Demo
		public static let demo = L10n.tr("Localizable", "Demo")
		/// Keywords
		public static let keywords = L10n.tr("Localizable", "Keywords")
		/// Price
		public static let price = L10n.tr("Localizable", "Price")
		public enum Items {
			/// Plural format key: "%#@count@"
			public static func count(_ p1: Int) -> String {
				return L10n.tr("Localizable", "items.count", p1)
			}
		}
	}
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
	private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
		let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
		return String(format: format, locale: Locale.current, arguments: args)
	}
}

// swiftlint:disable convenience_type
private final class BundleToken {
	static let bundle: Bundle = {
		#if SWIFT_PACKAGE
		return Bundle.module
		#else
		return Bundle(for: BundleToken.self)
		#endif
	}()
}
// swiftlint:enable convenience_type
